//
//  SearchResultViewController.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import UIKit

struct SearchSection {
    let title: String
    let result: [SearchResult]
}

protocol SearchResultViewControllerDelegate: AnyObject {
    func didtapResult(_ result: SearchResult)
}

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: SearchResultViewControllerDelegate?

    private var sections: [SearchSection] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.register(
            SearchResultDefaultTableTableViewCell.self,
            forCellReuseIdentifier: SearchResultDefaultTableTableViewCell.identifier
        )
        tableView.register(
            SearchResultSubtitleTableViewCell.self,
            forCellReuseIdentifier: SearchResultSubtitleTableViewCell.identifier
        )
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func update(with results: [SearchResult]){
        
        let artists = results.filter({
            switch $0 {
            case .artist: return true
            default: return false
            }
        })
        let albums = results.filter({
            switch $0 {
            case .album: return true
            default: return false
            }
        })
        let tracks = results.filter({
            switch $0 {
            case .track: return true
            default: return false
            }
        })
        let playlists = results.filter({
            switch $0 {
            case .playlist: return true
            default: return false
            }
        })
        
        self.sections = [
            SearchSection(title: "Artists", result: artists),
            SearchSection(title: "Albums", result: albums),
            SearchSection(title: "Songs", result: tracks),
            SearchSection(title: "Playlists", result: playlists)
        ]
        
        tableView.reloadData()
        tableView.isHidden = results.isEmpty
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = sections[indexPath.section].result[indexPath.row]
        
        switch result {
        case .artist(let artist):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultDefaultTableTableViewCell.identifier,
                    for: indexPath) as? SearchResultDefaultTableTableViewCell else {
                return UITableViewCell()
            }
            let viewModel = SearchResultDefaultTableTableViewCellViewModel(
                title: artist.name,
                imageURL: URL(string: artist.images?.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
            
        case .album(let album):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultSubtitleTableViewCell.identifier,
                    for: indexPath) as? SearchResultSubtitleTableViewCell else {
                return UITableViewCell()
            }
            let viewModel = SearchResultSubtitleTableViewCellViewModel (
                title: album.name,
                subtitle: album.artists.first?.name ?? "",
                imageURL: URL(string: album.images.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
        case .track(let track):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultSubtitleTableViewCell.identifier,
                    for: indexPath) as? SearchResultSubtitleTableViewCell else {
                return UITableViewCell()
            }
            let viewModel = SearchResultSubtitleTableViewCellViewModel (
                title: track.name,
                subtitle: track.artists.first?.name ?? "-",
                imageURL: URL(string: track.album?.images.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
        case .playlist(let playlist):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultSubtitleTableViewCell.identifier,
                    for: indexPath) as? SearchResultSubtitleTableViewCell else {
                return UITableViewCell()
            }
            let viewModel = SearchResultSubtitleTableViewCellViewModel (
                title: playlist.name,
                subtitle: playlist.owner.display_name,
                imageURL: URL(string: playlist.images.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = sections[indexPath.section].result[indexPath.row]
        delegate?.didtapResult(result)
        

    }
    
    
    
}
