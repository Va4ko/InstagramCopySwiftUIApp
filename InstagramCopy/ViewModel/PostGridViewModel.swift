//
//  PostGridViewModel.swift
//  InstagramCopy
//
//  Created by Vachko on 12.05.21.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchExplorePagePosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
        }
    }
    
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePagePosts()
        case .profile(let uid):
            fetchUserPost(forUid: uid)
        }
    }
    
    func fetchUserPost(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self)})
            self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
        }
    }
    
    
}
