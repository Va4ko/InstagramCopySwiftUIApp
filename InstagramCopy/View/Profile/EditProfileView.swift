//
//  EditProfileView.swift
//  InstagramCopy
//
//  Created by Vachko on 21.05.21.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.presentationMode) var mode
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: UserModel
    
    init(user: Binding<UserModel>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {mode.wrappedValue.dismiss()}, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Button(action: {viewModel.saveUserBio(bioText)}, label: {
                    Text("Done").bold()
                })
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: UIScreen.main.bounds.width, height: 200)
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete, perform: { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
    }
}

//struct EditProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
