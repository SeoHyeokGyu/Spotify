//
//  AuthResponse.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/06.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
