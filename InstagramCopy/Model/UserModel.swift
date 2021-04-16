//
//  UserModel.swift
//  InstagramCopy
//
//  Created by Vachko on 16.04.21.
//

import FirebaseFirestoreSwift

struct UserModel: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageURL: String
    let fullname: String
    @DocumentID var id: String?
    
    var isCurrenUser: Bool { return AuthViewModel.shared.userSession?.uid == id}
}
