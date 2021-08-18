//
//  SearchResult.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/18.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
