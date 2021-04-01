//
//  NotificationCell.swift
//  InstagramCopy
//
//  Created by Vachko on 1.04.21.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = false
    
    var body: some View {
        HStack{
            Image("Ronaldo")
                .resizable()
                .scaledToFill()
                .frame(width: 38, height: 38)
                .clipped()
                .cornerRadius(19)
//                .padding(.leading)
            
            Text("Ronaldo").font(.system(size: 14, weight: .semibold)) +
                Text(" liked one of your posts").font(.system(size: 14))
            
            Spacer()
            
            if showPostImage {
                Image("Ronaldo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38)
                    .clipped()
    //                .padding(.trailing)
            } else {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .semibold))
                        .clipShape(Capsule())
                })
            }
            
            

            
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
