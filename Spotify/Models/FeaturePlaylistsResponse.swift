//
//  FeaturePlaylistsResponse.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/10.
//

import Foundation

struct FeaturePlaylistResponse: Codable{
    let playlists: PlaylistResponse
}

struct PlaylistResponse: Codable{
    let items: [Playlist]
}


struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
