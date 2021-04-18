//
//  CharacterCellView.swift
//  FontFace (macOS)
//
//  Created by 吕俊 on 2021/4/18.
//

import SwiftUI

struct CharacterCellView: View {
    
    var name: String
    var characterModel: CharacterModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(characterModel.character)
                .font(Font.custom(name, size: 30))
                .foregroundColor(.red)
                .padding(.bottom, 3)
            Text(characterModel.unicode)
                .font(.body)
                .foregroundColor(.gray)
        }
        .frame(width: 80, height: 80)
        .padding()
    }
}

struct FontCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(name: "PingFang", characterModel: mockCharacterModel)
    }
}
