//
//  NowPlayingCall.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/27/25.
//

import Foundation


class APICalls {
    
    
// THIS NEEDS TO CHANGE FOR SECURITY REASONS
    
  var headers = ["accept": "application/json",
                 "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzhmZGI1ODc5MGZhNWI0MTJjNWY4ZjFhYjM4Mzg4OSIsIm5iZiI6MTY5Mjc2MDM1MC41NTUsInN1YiI6IjY0ZTU3OTFlYzYxM2NlMDBjOWYwOGI1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2n4706NH9_3zNdJtYZaoKYq3gg-uhTCxpQeECdhZwW4"
  
  ]
 
    
    // MARK: SOME API CALLS NEED A HEADER? HOW DO WE KNOW WHICH API CALLS NEED ONE? OR DO WE PLAY IT SAFE AND GIVE EVERY API CALL HEADERS
    func nowPlayingCalls() async throws -> [Results] {
        var req = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        req.httpMethod = "GET"
        req.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: req)
        guard let httresponse = response as? HTTPURLResponse, httresponse.statusCode == 200 else {
            throw CallError.runTimeError("there was an error")
        }
        let returningThis = try JSONDecoder().decode(NowPlaying.self, from: data)
        let finalreturn = returningThis.results
        return finalreturn
    }
    
    // MARK: WHY THIS NO WORK? COMPARED TO THE TOP FUNCTION
    /*
    func nowPlayingCall() async throws -> [Results] {
        let nowPlayingUrl = URL(string: myUrl)!
        var myrequest = URLRequest(url: nowPlayingUrl)
        myrequest.httpMethod = "GET"
        myrequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: myrequest)
        let response = try JSONDecoder().decode(NowPlaying.self, from: data)
        print(response.results)
        return response.results
    }
     */
    

}

