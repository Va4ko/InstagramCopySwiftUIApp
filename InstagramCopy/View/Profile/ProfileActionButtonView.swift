//
//  ProfileActionButtonView.swift
//  InstagramCopy
//
//  Created by Vachko on 6.04.21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false}
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 340, height: 32)
                    .foregroundColor(.primary)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                //                        .padding(.leading, 35)
            })
        } else {
            HStack {
                Spacer()
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 170, height: 32)
                        .foregroundColor(isFollowed ? .primary : .white)
                        .background(isFollowed ? Color.clear : Color.blue)
                        .border(Color.gray, width: isFollowed ? 1 : 0)
                    //                        .overlay(
                    //                            RoundedRectangle(cornerRadius: 3)
                    //                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                    //                        )
                })
                .cornerRadius(3)
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 170, height: 32)
                        .foregroundColor(.primary)
                        .background(Color.clear)
                        .border(Color.gray, width: 1)
                    //                        .overlay(
                    //                            RoundedRectangle(cornerRadius: 3)
                    //                                .stroke(Color.gray, lineWidth: 1)
                    //                        )
                    
                })
                .cornerRadius(3)
                Spacer()
            }
        }
    }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView()
//    }
//}
