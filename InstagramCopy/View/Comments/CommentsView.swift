//
//  CommentsView.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct CommentsView: View {
    var body: some View {
        // comments cells
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                ForEach(0 ..< 5) { _ in
                    CommentCell()
                }
            }
        }.padding(.top)
        
        // input view
        
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
