//
//  FirstViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/29/25.
//

import UIKit
import FirebaseAuth



class FirstViewController: UIViewController {
    
    var currentUser = Auth.auth().currentUser!
    
    @IBOutlet weak var myTitleAndButton: UIStackView!
    
    var nowPlayingRespond = MovieResponse()

   
    
    
    
    override func viewDidLoad() {
        self.view.bringSubviewToFront(myTitleAndButton)
        //runThisUser()
        //nowPlayingRespond.nowPlayingResponse()
    }
    
    
    @IBAction func showUsersProfile(_ sender: UIButton) {
        print("show users profile")
    }
    
    
    
  
    func runThisUser() {
        let user = currentUser.uid
        print(user)
    }
    
    
    

}
