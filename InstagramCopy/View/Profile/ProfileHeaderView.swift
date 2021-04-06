//
//  ProfileHeaderView.swift
//  InstagramCopy
//
//  Created by Vachko on 6.04.21.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Ronaldo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                //                    .padding(.leading, 30)
                
                HStack(spacing: 10) {
                    UserStatView(value: 72, title: "Posts")
                    UserStatView(value: 196, title: "Followers")
                    UserStatView(value: 55, title: "Following")
                }
                //                .padding(.trailing, 20)
                
                Spacer()
            }
            //            .padding(.leading)
            
            VStack(alignment: .leading) {
                Text("Ronaldo")
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.leading, 20)
                
                Text("Great of All Time!")
                    .font(.system(size: 15))
                    .padding(.leading, 20)
            }
            
            HStack{
                Spacer()
                ProfileActionButtonView()
                Spacer()
            }
            .padding(.top, 2)
        }
    }
    
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
