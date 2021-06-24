//
//  LoginViewController.swift
//  FakeSnap
//
//  Created by mbtec22 on 19/06/21.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {


    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var onClickBackBtn: UIButton!
    @IBOutlet weak var userOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        // Do any additional setup after loading the view.
    }
    func setUpStyle(){
        loginButton.layer.cornerRadius = 6.0
        userOrEmailTextField.text = "lujan@gmail.com"
        passwordTextField.text = "contraseña"
    }
    @IBAction func onClickBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickLogin(_ sender: Any) {
        Auth.auth().signIn(withEmail: userOrEmailTextField.text!, password: passwordTextField.text!, completion: {(user, error) in
            print ("Intentamos Iniciar Sesión")
            if error != nil {
                print("Tenemos el error:")
            } else {
                print ("Inicio de sesión correcto")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        })
        
        
    }
    
}
