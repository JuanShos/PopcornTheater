//
//  SignUpViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/31/25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passworldTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var emailString = ""
    var passwordString = ""
    let textField = UITextField()
    var db: Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passworldTextField.delegate = self
        db = Firestore.firestore()
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
        if emailString.isEmpty == true && passwordString.isEmpty == true {
            
            print("shits empty ")
        } else {
            createUser(email: emailString, password: passwordString)
        }
    }
    
    //MARK: SOME WEIRD ERROR: TELLS ME PASSWORD HAS TO BE 6 CHARACTERS OR LONGER EVEN WHEN THR EREQUIRMENTS ARE MET
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("error creating user: \(error)")
                return
            }
            guard let userId = Auth.auth().currentUser?.uid else { return }
            Auth.auth().currentUser?.sendEmailVerification()
            self.saveUserInfo(uid: userId)
            //self.createTheUser(usersID: userId)
            
            //self.dismiss(animated: true)
            print("user created successfully")
        }
    }
    
    // MARK: THIS RIHT HERE THE RIGHT WAY TO DO IT
    func saveUserInfo(uid: String) {
        let db = Firestore.firestore()
        let userref = db.collection("myUsers").document(uid)
        let userData: [String: Any] = [
            "name": "your mom",
            "email": "thisemail",
            "age": 27
            ]
        userref.setData(userData) { error in
            if let error = error {
                print("something went wrong \(error)")
            } else {
                print("saved successfully")
            }
            
        }
        
    }
    
    func createTheUser(usersID: String) {
        Task {
            do {
                let ref = try await db.collection("users/\(usersID)/userData").addDocument(data: [
                    "name" : "juan's new collection",
                    "lastname" : "jndcjon",
                    "age": 26,
                    "username": "supercoolman"
                ])
                print("document added with ID   \(ref.documentID)")
                print(usersID)
            } catch {
                print("Error adding document \(error)")
            }
        }
    }
    
    
    
    // MARK: SO USER DOESNT JUST SEND EMPTY INFORMATION; DO MORE WITH THIS LATER
    func checkTextField() {
        if emailString.isEmpty == true && passwordString.isEmpty == true {
            signUpButton.isEnabled = false
        }
    }
    
    
}
