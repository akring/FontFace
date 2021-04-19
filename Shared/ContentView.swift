//
//  ContentView.swift
//  Shared
//
//  Created by 吕俊 on 2021/4/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedFontFamily: String = ""
    @State private var selectedFontName: String = ""
    
    var body: some View {
            NavigationView {
                AvailableFontListView(selectedFontFamily: $selectedFontFamily, selectedFontName: $selectedFontName)
                CharacterGraidView(selectedFontFamily: $selectedFontFamily, selectedFontName: $selectedFontName)
            }
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
