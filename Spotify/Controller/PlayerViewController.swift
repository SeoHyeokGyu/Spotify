//
//  PlayerViewController.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import UIKit
import SDWebImage

protocol PlayerViewControllerDelegate: AnyObject {
    func didTapPlayPause()
    func didTapForward()
    func didTapBackward()
    func didSlideSlider(_ value: Float)
    
}

class PlayerViewController: UIViewController {
    
    weak var dataSource: PlayerDataSource?
    weak var delegate: PlayerViewControllerDelegate?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
        configure()
        
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
    
    private func configure() {
        imageView.sd_setImage(with: dataSource?.imageURL, completed: nil)
        controlsView.configure(
            with: PlayerControlsViewViewModel(
                title: dataSource?.songName,
                subtitle: dataSource?.subtitle)
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
    
    func refreshUI() {
        configure()
    }
    
}

extension PlayerViewController: PlayerControlsViewDelegate{
    func playerControlsViewDidTapPlayPauseButton(_ playserControlView: PlayerControlsView) {
        delegate?.didTapPlayPause()
    }
    
    func playerControlsViewDidTapForwardButton(_ playserControlView: PlayerControlsView) {
        delegate?.didTapForward()
    }
    
    func playerControlsViewDidTapBackwardButton(_ playserControlView: PlayerControlsView) {
        delegate?.didTapBackward()
    }
    
    func playerControlsView(_ playserControlView: PlayerControlsView, didSlideSlider value: Float) {
        delegate?.didSlideSlider(value)
    }
    
}
