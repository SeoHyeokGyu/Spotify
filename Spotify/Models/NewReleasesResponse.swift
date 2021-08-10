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
    let available_marckets: [String]
    let id: String
    let images: [APIImage]
    let name: String
    let release_data: String
    let total_tracks: Int
    let areist: [Artist]

}

