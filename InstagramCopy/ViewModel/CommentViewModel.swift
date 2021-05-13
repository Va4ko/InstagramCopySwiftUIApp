//
//  CommentViewModel.swift
//  InstagramCopy
//
//  Created by Vachko on 12.05.21.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
    
    private let post: Post
    @Published var comments = [Comment]()
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(commentText: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String: Any] = ["username": user.username,
                                   "profileImageUre": user.profileImageURL,
                                   "uid": user.id ?? "",
                                   "timestamp": Timestamp(date: Date()),
                                   "postOwnerUid": post.ownerUid,
                                   "commentText": commentText
        ]
        
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print ("There is an error uploading your comment \(error.localizedDescription)")
                return
            }
        }
        
    }
    
    func fetchComments() {
        
    }
    
    
}
