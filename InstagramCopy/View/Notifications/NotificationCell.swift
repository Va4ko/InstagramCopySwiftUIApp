//
//  NotificationCell.swift
//  InstagramCopy
//
//  Created by Vachko on 1.04.21.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var showPostImage = false
    
    var body: some View {
        HStack{
            if let user = viewModel.notification.user {
                NavigationLink(
                    destination: ProfileView(user: user),
                    label: {
                        KFImage(URL(string: viewModel.notification.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 38, height: 38)
                            .clipped()
                            .cornerRadius(19)
                        
                        Text(viewModel.notification.username)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.primary) +
                            Text(viewModel.notification.type.notificationMessage)
                            .font(.system(size: 14))
                            .foregroundColor(.primary) +
                            Text(" \(viewModel.timeStampString)")
                            .font(.system(size: 12))
                            .foregroundColor(.primary)
                    })
            }
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(
                        destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                        label: {
                            KFImage(URL(string: post.imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 38, height: 38)
                                .clipped()
                        })
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 100, height: 32)
                        .foregroundColor(isFollowed ? .primary : .white)
                        .background(isFollowed ? Color.clear : Color.blue)
                        .border(Color.gray, width: isFollowed ? 1 : 0)
                })
            }
            
            
            
            
        }.padding(.horizontal)
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
