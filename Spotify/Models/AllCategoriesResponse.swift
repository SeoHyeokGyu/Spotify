//
//  AllCategoriesResponse.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/17.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
