//
//  LogInViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 2/2/25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfField: UITextField!
    
    var myemail = ""
    var mypassword = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("log in stuff goes here")
        emailTextField.delegate = self
        passwordTextfField.delegate = self
    }
    

// MARK: WHEN USER TAPS OUTSIDE THE TEXTFIELD KEYBOARD DISMISSES
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
    
    
    // MARK: THE REASON FOR THAT WEIRD PROBLEM IS DUE TO THE TEXTFIELD ONLY PASSING THE TEXTFIELD DATA AFTER ITS DONE EDITING
    func textFieldDidEndEditing(_ textField: UITextField) {
        myemail = emailTextField.text ?? ""
        mypassword = passwordTextfField.text ?? ""
        print(textField.text ?? "nothing is here")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    @IBAction func emailTextField(_ sender: UITextField) {
        print(emailTextField.text ?? "nothing is here")
    }
    
    @IBAction func passwordTxtField(_ sender: UITextField) {
        print(passwordTextfField.text ?? "nothing is here")
    }
    
  
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func logInButton(_ sender: UIButton) {
      
        
        if myemail.isEmpty == true && mypassword.isEmpty == true {
            print("im empty")
        } else {
            logMeIn(myemail: myemail, mypassword: mypassword)
        }
    }
    
    func logMeIn(myemail: String, mypassword: String) {
        Auth.auth().signIn(withEmail: myemail, password: mypassword) { (authresult, error) in
            if let error = error {
                print("eror \(error)")
                return
            }
            self.grabMyData()
            self.performSegue(withIdentifier: "home", sender: nil)
        }
    }
    
    // MARK: DIS THE RIGHT WAY TO DO IT
    func grabMyData() {
        guard let user = Auth.auth().currentUser else { return }
        print("user email: \(user.email ?? "no email found")")
        
        let userUid = user.uid
        let db = Firestore.firestore()
        
        let userref = db.collection("myUsers").document(userUid)
        
        userref.getDocument() { (document, error) in
            if let error = error {
                print("something went wrong \(error)")
            }
            
            if let docu = document, docu.exists {
                let userData = docu.data()
                print("user data: \(userData ?? [:])")
            } else {
                print("user docu not here")
            }
            
        }
    }
    
    
    func getMyData() {
        guard let user = Auth.auth().currentUser else { return }
        print("user email: \(user.email ?? "no email found")")
        print(user.uid)
        
        let userUid = user.uid
        let db = Firestore.firestore()
        
        let userRef = db.collection("users").document(userUid).collection("userID")
      
        print(userRef)
        
        userRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        
        
        
    }
    
    
    

}
