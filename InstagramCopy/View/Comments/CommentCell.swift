//
//  ComentCell.swift
//  InstagramCopy
//
//  Created by Vachko on 12.05.21.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("Ronaldo")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                .cornerRadius(18)
            
            Text("Ronaldo").font(.system(size: 14, weight: .semibold)) +
                Text(" Some comment here...").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }.padding(.horizontal)
    }
}

struct ComemntCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
