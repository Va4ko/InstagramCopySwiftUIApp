//
//  UserCell.swift
//  InstagramCopy
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("Ronaldo")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                .clipShape(Circle())
//                .cornerRadius(48 / 2)
            
            VStack(alignment: .leading) {
                Text("Ronaldo")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Soccer player")
                    .font(.system(size: 14))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
