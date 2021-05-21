//
//  EditProfileViewModel.swift
//  InstagramCopy
//
//  Created by Vachko on 21.05.21.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: UserModel
    @Published var uploadComplete = false
    
    init(user: UserModel) {
        self.user = user
    }
    
    func saveUserBio(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio" : bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
}
