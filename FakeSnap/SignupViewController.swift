//
//  SignupViewController.swift
//  FakeSnap
//
//  Created by mbtec22 on 21/06/21.
//


import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignupViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let databaseReference = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUpTapped(_ sender: Any) {
            if emailTextField.text?.isEmpty == true {
                print("No text in email field")
                return
        }
            if passwordTextField.text?.isEmpty == true {
                print("No text in password field")
                return
            }
        signUP()
        }
        
    @IBAction func backButton(_ sender: Any) {
            navigationController?.popViewController(animated: true)
        }
    func signUP(){
        let user = emailTextField.text!
                let password = passwordTextField.text!
                
               
                Auth.auth().createUser(withEmail: user, password: password) { (responseUser, error) in
                    if error == nil {
                        print("El usuario fue creado exitosamente")
                        let userFirebase = Auth.auth().currentUser
                        let uid = userFirebase?.uid
                        self.storeData(user: user, uid: uid!)
                        self.performSegue(withIdentifier: "signSegue", sender: nil)
                    } else {
                        let alert = UIAlertController(title: "Error", message: "User or Password incorrect", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alert.addAction(alertAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                }

                
                
            }
    
    func storeData(user: String, uid: String) {
            
            let object:[String: Any] = [
                "id": uid,
                "email": user as NSObject
            ]
            databaseReference.child("users").child(uid).setValue(object)
        }
        
    }




 



