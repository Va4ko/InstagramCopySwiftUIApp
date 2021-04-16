//
//  SearchViewModel.swift
//  InstagramCopy
//
//  Created by Vachko on 16.04.21.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [UserModel]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: UserModel.self)})
            print("VACHKO: \(self.users)")
        }
    }
    
    func filteredUsers(_ query: String) -> [UserModel] {
        let lowercasedQuery = query.lowercased()
        return users.filter({$0.fullname.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery)})
    }
    
}
