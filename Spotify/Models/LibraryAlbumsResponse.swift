//
//  LibraryAlbumsResponse.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/30.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
