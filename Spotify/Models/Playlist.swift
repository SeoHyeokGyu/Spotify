//
//  Playlist.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
