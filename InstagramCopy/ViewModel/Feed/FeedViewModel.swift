//
//  FeedViewModel.swift
//  InstagramCopy
//
//  Created by Vachko on 28.04.21.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = user.id else { return }
        
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let postsArray = documents.compactMap({ try? $0.data(as: Post.self)})
            self.posts = postsArray.filter {$0.ownerUid != uid}
        }
    }
    
    
    
    //    func fetchPosts() {
    //        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
    //            guard let documents = snapshot?.documents else { return }
    //
    //            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
    //
    //        }
    //    }
}
