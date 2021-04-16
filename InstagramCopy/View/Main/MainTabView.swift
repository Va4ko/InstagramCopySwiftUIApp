//
//  MainTabView.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct MainTabView: View {
    
    let user: UserModel
    
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                ProfileView(user: user)
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: logutbutton)
            .accentColor(.black)
        }
    }
    
    var logutbutton: some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            Text("Logout")
                .foregroundColor(.primary)
        }

    }
    
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
