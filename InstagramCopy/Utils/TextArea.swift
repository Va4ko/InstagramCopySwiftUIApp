//
//  TextArea.swift
//  InstagramCopy
//
//  Created by Vachko on 23.04.21.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeHolder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeHolder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}

//struct TextArea_Previews: PreviewProvider {
//    static var previews: some View {
//        TextArea()
//    }
//}
