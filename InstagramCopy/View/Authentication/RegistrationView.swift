//
//  RegistrationView.swift
//  InstagramCopy
//
//  Created by Vachko on 8.04.21.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @State var imagePickerPresened = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    imagePickerPresened.toggle()
                }, label: {
                    if profileImage == nil {
                        Image("AddButton")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                            .padding()
                    } else if let image = profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .clipped()
                            .padding()
                    }
                }).sheet(isPresented: $imagePickerPresened, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
                
                VStack(spacing: 20){
                    CustomTextField(text: $email, placeHolder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $userName, placeHolder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeHolder: Text("Full name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomSecureField(text: $password, placeHolder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                }
                
                Button(action: {
                    viewModel.register(withEmail: email, password: password, image: selectedImage, username: userName, fullname: fullName)
                }, label: {
                    Text("Sign Up")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top, 20)
                        .padding(.horizontal)
                    
                })
                
                Spacer()
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                }).padding(.bottom, 16)
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .previewDevice("iPhone 12")
    }
}
