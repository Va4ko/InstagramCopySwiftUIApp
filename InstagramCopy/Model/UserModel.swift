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
    var isFollowed: Bool? = false
    var stats: UserStats?
    var bio: String?
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id}
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
