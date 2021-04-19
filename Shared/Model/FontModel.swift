//
//  FontModel.swift
//  FontFace (macOS)
//
//  Created by 吕俊 on 2021/4/18.
//

import Foundation

struct FontModel: Hashable {
    var name: String
    var familyName: String
}

struct CharacterModel: Hashable {
    var character: String
    var unicode: String
}

let mockFontModel = FontModel(name: "PingFang", familyName: "PingFang")

let mockCharacterModel = CharacterModel(character: "T", unicode: "\u{e638}")
