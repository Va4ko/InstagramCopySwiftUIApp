//
//  AuthViewModel.swift
//  InstagramCopy
//
//  Created by Vachko on 14.04.21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func logIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error with signing in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            
            print("Log in")
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, username: String, fullname: String) {
        guard let image = image else { return }
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else { return }
                print("Successfully registration!")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageURL": imageUrl,
                            "UID": user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Succesfully uploaded user data!")
                    self.userSession = user
                    self.fetchUser()
                }
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPaswword() {
        
    }
    
    func fetchUser() {
        guard let userUID = userSession?.uid else { return }
        COLLECTION_USERS.document(userUID).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: UserModel.self) else { return }
            self.currentUser = user
        }
    }
}
