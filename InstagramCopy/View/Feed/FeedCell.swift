//
//  FeedCell.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // User info
            HStack {
                Image("Ronaldo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .cornerRadius(18)
                
                Text("Ronaldo")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            // Post image
            Image("Ronaldo")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 250)
                .clipped()
            
            // action buttons
            
            HStack(spacing: 16) {
                Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                Button (action: {}, label: {
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
            .foregroundColor(.red)
            
            // Captions
            Text("33 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("Ronaldo:").font(.system(size: 14, weight: .semibold)) +
                    Text(" Tonight is the very important mach. We will try to win!")
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.top, 2)
                .padding(.leading, 8)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
