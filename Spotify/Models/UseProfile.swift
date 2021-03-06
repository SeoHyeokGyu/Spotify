//
//  UseProfile.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
   // let followers: [String: Codable?]
    let id: String
    let product: String
    let images: [APIImage]
}

