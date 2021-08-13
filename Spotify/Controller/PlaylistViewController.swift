//
//  PlaylistViewController.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import UIKit

class PlaylistViewController: UIViewController {

    private let playlist: Playlist
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(playlist: Playlist){
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist.name
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
        APICaller.shared.getPlaylistDetails(for: playlist) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
    
}
