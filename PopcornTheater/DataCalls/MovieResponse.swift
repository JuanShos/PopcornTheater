//
//  MovieCalls.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/29/25.
//

import Foundation

protocol Respond {
    func nowPlayingResponse()
}


class MovieResponse: Respond {
    
    var apiCall = APICalls()
    
    func nowPlayingResponse() {
        Task {
            do {
                let result = try await apiCall.nowPlayingCalls()
                print(result)
            } catch {
                print(error)
            }
        }
    }
    
    
}

