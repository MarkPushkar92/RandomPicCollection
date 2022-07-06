//
//  Models.swift
//  CollectonViewRandomPics
//
//  Created by Марк Пушкарь on 18.06.2022.
//

import Foundation

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue: String]
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

