//
//  UserLitView.swift
//  InstagramCopy
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 20) { _ in
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            UserCell()
                                .padding(.leading)
                        })
                }
            }
        }
    }
}

struct UserLitView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
