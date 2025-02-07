//
//  LogInViewController.swift
//  PopcornTheater
//
//  Created by Juanito Martinon on 1/31/25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore


class WelcomeViewController: UIViewController {
    
    var db: Firestore!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        print("this is a login page")
        //readthis()
        //sendThisInfo()
        //readYThisShit()
    }
    
  
    @IBAction func logInButton(_ sender: UIButton) {
        print("i should lead to the main page")
    }
    
    
    @IBAction func signUpButton(_ sender: UIButton) {
        print("i should lead to the sign up page")
    }
    
    func readthis() {
        Task {
            do {
                let snapshot = try await db.collection("users").getDocuments()
                for docu in snapshot.documents {
                    print(docu)
                }
            } catch {
                print(error)
            }
        }
    }
    
    
    /*
    // MARK: TESTING THE DATABASE AND SHIT BRO ; if successful this will be needed to go into a whole seperate file k?
    func sendThisInfo()  {
        Task {
            do {
                //let refer = try await db.collection("user").
                let ref = try await db.collection("users").addDocument(data: [
                    "name" : "cristian",
                    "lastname" : "rubio",
                    "age": 26,
                    "username": "cristianrocks"
                ])
                print("document added with ID   \(ref.documentID)")
            } catch {
                print("Error adding document \(error)")
            }
        }
    }
    */
    /*
    func readYThisShit() {
        var lastnamearray = [String]()
        Task {
            do {
                
                let snapshot = try await db.collection("users").getDocuments()
                for document in snapshot.documents {
                    lastnamearray.append(document.data()["lastname"] as! String)
                   //var lastname = document.data()["lastname"] as! String
                    //print(lastname)
                    //print(lastnamearray)
                   // print(document.get("age") as Any)
                    print("\(document.documentID) => \(document.data())")
                }
            } catch {
                print("error reading data: \(error)")
            }
        }
    }
    
    */
    
        
}
