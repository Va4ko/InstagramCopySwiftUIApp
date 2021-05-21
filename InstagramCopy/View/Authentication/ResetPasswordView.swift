//
//  ResetPasswordView.swift
//  InstagramCopy
//
//  Created by Vachko on 8.04.21.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Binding private var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image("Instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    .foregroundColor(.white)
                
                VStack(spacing: 20){
                    CustomTextField(text: $email, placeHolder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                }
                
                Button(action: {
                    viewModel.resetPaswword(withEmail: email)
                }, label: {
                    Text("Send Resset Passsword Link")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top)
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
            .padding(.top, -50)
            
        }
        .onReceive(viewModel.$didSendRessetPasswordLink, perform: { _ in
            self.mode.wrappedValue.dismiss()
        })
    }
}

//struct ResetPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPasswordView()
//    }
//}
