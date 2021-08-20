//
//  PlayerViewController.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import UIKit

class PlayerViewController: UIViewController {

    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    
    private let controlsView = PlayerControlsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlsView)
        controlsView.delegate = self
        congigureBarButtons()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.width)
        controlsView.frame = CGRect(
            x: 10,
            y: imageView.bottom + 10,
            width: view.width - 20,
            height: view.height - imageView.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 15
        )
    }
    
    private func congigureBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didtapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didtabAction))

    }
    
    @objc private func didtapClose(){
        dismiss(animated: true, completion: nil)
    }
    @objc private func didtabAction(){
    }

}

extension PlayerViewController: PlayerControlsViewDelegate{
    func PlayerControlsViewDidTapPlayPauseButton(_ playserControlView: PlayerControlsView) {
        
    }
    
    func PlayerControlsViewDidTapPlayForwardButton(_ playserControlView: PlayerControlsView) {
        
    }
    
    func PlayerControlsViewDidTapPlayBackwardButton(_ playserControlView: PlayerControlsView) {
        
    }
    
    
}
