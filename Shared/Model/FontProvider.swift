//
//  FontProvider.swift
//  FontFace (macOS)
//
//  Created by 吕俊 on 2021/4/19.
//

import Cocoa

class FontProvider {
    static let shared = FontProvider()
    private init() {}
    
    /// Fetch CharacterModel for given font family
    /// - Returns: CharacterModel List
    func fetchCharacterList(familyName: String) -> [CharacterModel] {
        
        guard let font = NSFontManager.shared.font(withFamily: familyName, traits: .smallCapsFontMask, weight: 1, size: 30) else { return [] }
        
        let set = font.coveredCharacterSet as NSCharacterSet
        
        return set.characters.filter({ !$0.character.isEmpty || !$0.unicode.isEmpty})
    }
    
    /// Fetch available font List
    /// - Returns: FontModel List
    func fetchAvailableFontList() -> [FontModel] {
        
       return NSFontManager.shared.availableFontFamilies
            .compactMap({NSFontManager.shared.font(withFamily: $0, traits: .boldFontMask, weight: 1, size: 30)})
            .compactMap { font -> FontModel? in
                guard let name = font.displayName else { return nil }
                guard let familyName = font.familyName else { return nil }
                return FontModel(name: name, familyName: familyName)
            }
    }
}
