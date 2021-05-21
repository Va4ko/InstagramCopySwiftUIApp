//
//  UserLitView.swift
//  InstagramCopy
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [UserModel] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(
                        destination: LazyView(ProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                                .padding(.leading)
                        })
                }
            }
        }
    }
}

//struct UserLitView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView(viewModel: nil)
//    }
//}
