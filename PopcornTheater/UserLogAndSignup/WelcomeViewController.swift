//
//  LogInViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/31/25.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("this is a login page")
    }
    

    @IBAction func logInButton(_ sender: UIButton) {
        print("i should lead to the main page")
    }
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        print("i should lead to the sign up page")
    }
    
}
