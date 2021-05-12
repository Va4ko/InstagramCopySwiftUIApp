//
//  ProfileView.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct ProfileView: View {
    
    let user: UserModel
    @ObservedObject var viewModel: ProfileViewModel
    
    
    init (user: UserModel) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15 ) {
                
                ProfileHeaderView(viewModel: viewModel)
                
                PostGridView(config: .profile(user.id ?? ""))
                
            }.padding(.top)
            
        }
        
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//            .previewDevice("iPhone 12")
//    }
//}
