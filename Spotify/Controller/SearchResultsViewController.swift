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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch result {
        case .artist(let model):
            cell.textLabel?.text = model.name
        case .album(let model):
            cell.textLabel?.text = model.name
        case .track(let model):
            cell.textLabel?.text = model.name
        case .playlist(let model):
            cell.textLabel?.text = model.name
        }
        return cell
        
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
