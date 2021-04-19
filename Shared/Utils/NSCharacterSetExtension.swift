//
//  NSCharacterSetExtension.swift
//  FontFace (macOS)
//
//  Created by 吕俊 on 2021/4/18.
//

import Foundation

extension NSCharacterSet {
    var characters:[CharacterModel] {
        var results = [CharacterModel]()
        for plane:UInt8 in 0...16 {
            if self.hasMemberInPlane(plane) {
                let p0 = UInt32(plane) << 16
                let p1 = (UInt32(plane) + 1) << 16
                for c:UTF32Char in p0..<p1 {
                    if self.longCharacterIsMember(c) {
                        var c1 = c.littleEndian
                        let s = NSString(bytes: &c1, length: 4, encoding: String.Encoding.utf32LittleEndian.rawValue)!
                        let dataenc = s.data(using: String.Encoding.nonLossyASCII.rawValue)
                        let unicodeValue = String(data: dataenc!, encoding: String.Encoding.utf8) ?? ""
                        
                        let v = CharacterModel(character: String(s), unicode: unicodeValue)
                        results.append(v)
                    }
                }
            }
        }
        return results
    }
}
