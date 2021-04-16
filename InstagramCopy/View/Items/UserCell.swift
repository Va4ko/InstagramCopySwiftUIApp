//
//  UserCell.swift
//  InstagramCopy
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: UserModel
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipped()
                .clipShape(Circle())
//                .cornerRadius(48 / 2)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                
                Text(user.fullname)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
            Spacer()
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
