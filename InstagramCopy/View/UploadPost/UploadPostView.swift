//
//  UploadPostView.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresened = false
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {
                    imagePickerPresened.toggle()
                }, label: {
                    Image("AddButton")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .foregroundColor(.primary)
                        .padding(.top, 30)
                }).sheet(isPresented: $imagePickerPresened, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
            } else if let image = postImage {
                HStack(alignment: .top, spacing: 10) {
                    Spacer()
//                    Image("Ronaldo")
                        image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                    
                    TextField("Enter your caption here...", text: $captionText)
                        .frame(width: 250, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                        .textFieldStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Text Field Style@*/DefaultTextFieldStyle()/*@END_MENU_TOKEN@*/)
                    Spacer()
                }.padding(.top, 20)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }).padding(.top, 30)
            }
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
