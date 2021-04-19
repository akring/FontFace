//
//  AvailableFontListView.swift
//  FontFace (macOS)
//
//  Created by 吕俊 on 2021/4/19.
//

import SwiftUI

struct AvailableFontListView: View {
    
    @Binding var selectedFontFamily: String
    
    @Binding var selectedFontName: String
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(FontProvider.shared.fetchAvailableFontList(), id: \.self) { fontModel in
                    HStack {
                        Text(fontModel.name)
                            .font(.body)
                            .padding()
                            
                        Spacer()
                    }
                    .onTapGesture {
                        selectedFontFamily = fontModel.familyName
                        selectedFontName = fontModel.name
                    }
                    .background(fontModel.name == selectedFontName ? Color.red : Color.clear)
                }
            }
        }
    }
}

struct AvailableFontListView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableFontListView(selectedFontFamily: .constant(""), selectedFontName: .constant(""))
    }
}
