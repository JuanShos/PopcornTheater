//
//  ViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/23/25.
//

import UIKit

class ViewController: UIViewController {
    
    var apiController = APICalls()
    var nowPlayingRespond = MovieResponse()

    override func viewDidLoad() {
        super.viewDidLoad()
        nowPlayingRespond.nowPlayingResponse()
        //performCall()
    }

}

