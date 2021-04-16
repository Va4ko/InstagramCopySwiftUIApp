//
//  ProfileView.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct ProfileView: View {
    
    let user: UserModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15 ) {
                
                ProfileHeaderView(user: user)
                
                PostGridView()
                
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
