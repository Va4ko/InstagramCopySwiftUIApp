//
//  FeedCell.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // User info
                HStack {
                    if let user = viewModel.post.user {
                        NavigationLink(
                            destination: ProfileView(user: user),
                            label: {
                                KFImage(URL(string: viewModel.post.ownerImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipped()
                                    .cornerRadius(18)
                                
                                Text(viewModel.post.ownerUsername)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Text("...")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.primary)
                                    .padding(.trailing, 8)
                            })
                    }
                }
                .padding([.leading, .bottom], 8)
                
                // Post image
                KFImage(URL(string: viewModel.post.imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 440)
                    .clipped()
                
                // action buttons
                
                HStack(spacing: 16) {
                    Button (action: {
                        didLike ? viewModel.unLike() : viewModel.like()
                    }, label: {
                        Image(systemName: didLike ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(didLike ? .red : .primary)
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    })
                    
                    NavigationLink(
                        destination: CommentsView(post: viewModel.post),
                        label: {
                            Image(systemName: "bubble.right")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .font(.system(size: 20))
                                .padding(4)
                        })
                    
                    Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "paperplane")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    })
                }
                .padding(.leading, 4)
                .foregroundColor(.primary)
                
                // Captions
                Text(viewModel.likeString)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                
                HStack {
                    Text("\(viewModel.post.ownerUsername):").font(.system(size: 14, weight: .semibold)) +
                        Text(" \(viewModel.post.caption)")
                        .font(.system(size: 15))
                }.padding(.horizontal, 8)
                
                Text(viewModel.timeStampString)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.top, 2)
                    .padding(.leading, 8)
                
            }
            .padding(.top, 10)
        }
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//    }
//}
