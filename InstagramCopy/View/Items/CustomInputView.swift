//
//  CustomInputView.swift
//  InstagramCopy
//
//  Created by Vachko on 13.05.21.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            // Divider
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            // HStack with send button and text field
            HStack{
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.primary)
                }
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
    }
}

//struct CustomInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomInputView(inputText: .constant(""))
//    }
//}
