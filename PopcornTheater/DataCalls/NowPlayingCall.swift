//
//  NowPlayingCall.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/27/25.
//

import Foundation


class NowPlayingCall {
    
    let queryItems: [URLQueryItem] = [
      URLQueryItem(name: "language", value: "en-US"),
      URLQueryItem(name: "page", value: "1"),
    ]
    
    func nowPlayingCall() async throws {
        // guard helps if url has no value
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing") else {
            return
        }
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        //urlComponents?.queryItems = queryItems.map { $0 + queryItems } ?? queryItems
                 
    }
    
    
    
    
    
    
}

