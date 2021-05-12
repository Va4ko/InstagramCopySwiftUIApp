//
//  SearchView.swift
//  InstagramSiftUITutorial
//
//  Created by Vachko on 31.03.21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearchMode = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            Spacer()
            
            ScrollView {
                ZStack {
                    if inSearchMode {
                        UserListView(viewModel: viewModel, searchText: $searchText)
                    } else {
                        PostGridView(config: .explore)
                    }
                }
            }
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
