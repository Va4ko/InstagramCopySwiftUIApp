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
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)) { user in
                    NavigationLink(
                        destination: ProfileView(user: user),
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
