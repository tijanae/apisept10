//
//  ArtistModel.swift
//  API-Keys-Lab
//
//  Created by Tia Lendor on 9/9/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

struct SongWrapper: Codable {
    let message: BodyInfo
}

struct BodyInfo: Codable{
    let body: TrackListInfo
}

struct TrackListInfo: Codable{
    var track_list: [TrackArray]
}
struct TrackArray: Codable {
    let track: TrackDetails
}
struct TrackDetails: Codable {
    let track_name: String
    let track_id: Int
    let has_lyrics: Int
    let album_name: String
    let artist_name: String
    
}

/*
{
"message": {
    "header": {
        "status_code": 200,
        "execute_time": 0.079313993453979,
        "available": 193
    },
    "body": {
        "track_list": [
        {
        "track": {
        "track_id": 136483403,
        "track_name": "6LACK That Far",
        "track_name_translation_list": [],
        "track_rating": 1,
        "commontrack_id": 75589114,
        "instrumental": 0,
        "explicit": 0,
        "has_lyrics": 0,
        "has_subtitles": 0,
        "has_richsync": 0,
        "num_favourite": 0,
        "album_id": 26914107,
        "album_name": "Street Kings 66",
        "artist_id": 33830721,
        "artist_name": "DJ Triple Exe",
        "track_share_url": "https://www.musixmatch.com/lyrics/DJ-Triple-Exe/6LACK-That-Far?utm_source=application&utm_campaign=api&utm_medium=",
        "track_edit_url": "https://www.musixmatch.com/lyrics/DJ-Triple-Exe/6LACK-That-Far/edit?utm_source=application&utm_campaign=api&utm_medium=",
        "restricted": 0,
        "updated_time": "2017-09-05T23:17:15Z",
        "primary_genres": {
        "music_genre_list": []
        }
        }
        },
*/

