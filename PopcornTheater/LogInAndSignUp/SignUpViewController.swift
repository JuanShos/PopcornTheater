//
//  SignUpViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/31/25.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passworldTextField: UITextField!
    
    var emailString = ""
    var passwordString = ""
    let textField = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passworldTextField.delegate = self
        print("this will be the signup page!")
    }
    
//MARK: THIS DISMISS THE TEXT FIELD WHEN USER TAPS OUTSIDE THE TEXTFIELD
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
           super.touchesBegan(touches, with: event)
       }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("did begin")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        emailString = emailTextField.text ?? ""
        passwordString = passworldTextField.text ?? ""
        print(textField.text ?? "nothing is here")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func emailTextField(_ sender: UITextField) {
        
        print(emailTextField.text ?? "nothing in here")
    }
    
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        print(passworldTextField.text ?? "nothing in here")
    }
    
    @IBAction func signUpCompleteButton(_ sender: UIButton) {
        print(emailString, passwordString, "this is from the email and password string")
        createUser(email: emailString, password: passwordString)
    }
    
    //MARK: SOME WEIRD ERROR: TELLS ME PASSWORD HAS TO BE 6 CHARACTERS OR LONGER EVEN WHEN THR EREQUIRMENTS ARE MET
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("error creating user: \(error)")
                return
            }
            self.dismiss(animated: true)
            print("user created successfully")
        }
    }
    
    
}
