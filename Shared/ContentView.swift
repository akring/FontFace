//
//  ContentView.swift
//  Shared
//
//  Created by 吕俊 on 2021/4/18.
//

import SwiftUI

struct ContentView: View {
    
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
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(fetchFontList(), id: \.self) { characterModel in
                        CharacterCellView(name: "PingFang", characterModel: characterModel)
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
}

/// 获取字符集及其 Unicode
/// - Returns: StringCharacter
func fetchFontList() -> [CharacterModel] {
    if let name = NSFontManager.shared.availableFontFamilies.first {
            
        if let font = NSFontManager.shared.font(withFamily: name, traits: .boldFontMask, weight: 1, size: 30) {
            
            let set = font.coveredCharacterSet as NSCharacterSet
            
            return set.characters
        }
    }
    
    return []
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
