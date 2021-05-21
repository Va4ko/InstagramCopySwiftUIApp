//
//  ProfileHeaderView.swift
//  InstagramCopy
//
//  Created by Vachko on 6.04.21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                KFImage(URL(string: viewModel.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                HStack(spacing: 10) {                    
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.user.fullname)
                    .font(.system(size: 15, weight: .semibold))
                    .padding(.leading, 20)
                
                if let bio = viewModel.user.bio {
                    Text(bio)
                        .font(.system(size: 15))
                        .padding(.leading, 20)
                }
            }
            
            HStack{
                Spacer()
                ProfileActionButtonView(viewModel: viewModel)
                Spacer()
            }
            .padding(.top, 2)
        }
    }
    
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
