//
//  CharacterGraidView.swift
//  FontFace (macOS)
//
//  Created by 吕俊 on 2021/4/19.
//

import SwiftUI

struct CharacterGraidView: View {
    
    @Binding var selectedFontFamily: String
    @Binding var selectedFontName: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            let list = FontProvider.shared.fetchCharacterList(familyName: selectedFontFamily)
            
            if list.isEmpty {
                Text("Select a font to preview")
                    .font(.title)
            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(list, id: \.self) { characterModel in
                            CharacterCellView(name: selectedFontName, characterModel: characterModel)
                        }
                    }
                }
            }
        }
        .padding()
        .frame(minWidth: 600, idealWidth: 700, minHeight: 400, idealHeight: 800, alignment: .center)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up.on.square.fill")
                }
            }
        }
    }
    
    func empty() -> Bool {
        return true
    }
}



struct CharacterGraidView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGraidView(selectedFontFamily: .constant("PingFang"), selectedFontName: .constant("PingFang"))
    }
}
