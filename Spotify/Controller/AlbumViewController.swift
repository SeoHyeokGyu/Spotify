//
//  AlbumViewController.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/13.
//

import UIKit

class AlbumViewController: UIViewController {
    
    private let album: Album
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(album: Album){
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Album"
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
        APICaller.shared.getAlbumDetails(for: album) {result in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    break
                case .failure(let error):
                    break
                }
            }
        }
    }
    



}
