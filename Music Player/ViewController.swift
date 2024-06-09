//
//  ViewController.swift
//  Music Player
//
//  Created by Omid Zaheri on 6/4/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! MusicCell
        
        cell.musicName.text = "Hobabe Sorati"
        cell.singerName.text = "Mahyar x Canis"
        cell.cover.image = UIImage(named: "hobabeSorati")
        cell.cover.layer.cornerRadius = 10
        cell.accessoryType = .disclosureIndicator
        cell.songTime.text = "4:14"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let musicPlayerVc = storyboard?.instantiateViewController(withIdentifier: "musicPlayerViewController")
        
        
        present(musicPlayerVc!, animated: true)
    }
    
    let searchController = UISearchController(searchResultsController: nil)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
        }

    
    var localizedSuggestion: String?
    
    var localizedAttributedSuggestion: NSAttributedString?
    
    var representedObject: Any?
    
}

