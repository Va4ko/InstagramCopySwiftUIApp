//
//  ComentCell.swift
//  InstagramCopy
//
//  Created by Vachko on 12.05.21.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                .cornerRadius(18)
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
                Text(" \(comment.commentText)").font(.system(size: 14))
                .foregroundColor(.primary)
            
            Spacer()
            
            Text("2m")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }.padding(.horizontal)
    }
}

//struct ComemntCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//    }
//}
