//
//  FirstViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/29/25.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    var nowPlayingRespond = MovieResponse()

    override func viewDidLoad() {
        nowPlayingRespond.nowPlayingResponse()
    }
    

}
