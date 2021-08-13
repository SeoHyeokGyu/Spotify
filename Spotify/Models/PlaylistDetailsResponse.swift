//
//  PlaylistDetailsResponse.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/13.
//

import Foundation

struct PlaylistDetailsResponse: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let tracks: PlaylistTracksResponse
}
 
struct PlaylistTracksResponse: Codable {
    let  items: [PlaylistItem]
}

struct PlaylistItem: Codable {
    let track: AudioTrack
}
