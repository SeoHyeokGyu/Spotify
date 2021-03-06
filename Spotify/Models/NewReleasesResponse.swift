//
//  NewReleasesResponse.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/10.
//

import Foundation

struct NewReleasesResponse:Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}

struct Album: Codable{
    let album_type: String
    let available_markets: [String]
    let id: String
    var images: [APIImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]

}


