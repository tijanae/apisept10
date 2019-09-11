//
//  SongAPIManagerFile.swift
//  API-Keys-Lab
//
//  Created by Tia Lendor on 9/10/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

class SongApiManager {
    
    private init () {}
    
    static let shared = SongApiManager()
    
    func getSongs(userSearchString: String, completionHandler: @escaping (Result<[TrackArray], Error>) -> Void) {
        let urlStr = "https://api.musixmatch.com/ws/1.1/track.search?q_track_artist=\(userSearchString)&apikey=990d361fbf684763b7969697f928ae01"
        
    
        
        guard let url = URL (string: urlStr) else{
            completionHandler(.failure(ErrorHandling.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, _, error) in
            guard error == nil else{
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            guard let data = data else{
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            do{
                let songData = try JSONDecoder().decode(SongWrapper.self, from: data)
                completionHandler(.success(songData.message.body.track_list))
            } catch {
                completionHandler(.failure(ErrorHandling.decodingError))
            }
        } .resume()
    }
    
    
    
    
    
    
}
