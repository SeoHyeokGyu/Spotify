//
//  SettingsModels.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/09.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: ()-> Void
}


