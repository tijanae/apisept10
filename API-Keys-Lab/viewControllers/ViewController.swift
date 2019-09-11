//
//  ViewController.swift
//  API-Keys-Lab
//
//  Created by Tia Lendor on 9/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   

    @IBOutlet weak var songTableView: UITableView!
    
    
    @IBOutlet weak var songSearchBar: UISearchBar!
    
    
    var musicAndLyrics = [TrackArray]() {
        didSet{
            songTableView.reloadData()
        }
    }
   
    
    var userSearchString: String? = nil{
    didSet{
        // Get new song data using userSearchString
        self.loadData()

        }
    }

    var userRequestedSearch: [TrackArray] {
        guard let searchedSong = userSearchString else{
            return musicAndLyrics
        }
        guard searchedSong != "" else{
            return musicAndLyrics
        }
        
        return musicAndLyrics.filter{$0.track.artist_name.lowercased().contains(searchedSong.lowercased())}
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTableView.delegate = self
        songTableView.dataSource = self
        songSearchBar.delegate = self
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        SongApiManager.shared.getSongs(userSearchString: userSearchString ?? "") { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let songArrFromOnline):
                    self.musicAndLyrics = songArrFromOnline
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userRequestedSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let musicInfo = userRequestedSearch[indexPath.row]
        let musicCell = songTableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) 
        musicCell.textLabel?.text = musicInfo.track.track_name.capitalized
        musicCell.detailTextLabel?.text = musicInfo.track.artist_name.capitalized
        return musicCell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        userSearchString = searchBar.text
    }

}

