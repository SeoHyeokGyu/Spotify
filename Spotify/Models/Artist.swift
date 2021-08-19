//
//  Artist.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String: String]
}
