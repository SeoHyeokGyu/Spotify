//
//  SearchResultsResponse.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/18.
//

import Foundation

struct SearchResultsResponse: Codable {
    let albums: SearchAlbumResponse
    let artists: SearchArtistsResponse
    let playlists: SearchPlaylistsResponse
    let tracks: SearchTrackstResponse
}

struct SearchAlbumResponse: Codable {
    let items: [Album]
    
}

struct SearchArtistsResponse: Codable {
    let items: [Artist]
}

struct SearchPlaylistsResponse: Codable {
    let items: [Playlist]
    
}

struct SearchTrackstResponse: Codable {
    let items: [AudioTrack]
}
