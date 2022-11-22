//
//  RegisterViewController.swift
//  SampleFirebaseProj
//
//  Created by DDUKK7 on 22/11/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerUser(_ sender: Any) {
        let emailTxt = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let passTxt = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: emailTxt, password: passTxt) {( AuthDataResult , error) in
                    if error != nil
                    {
                        print( error as Any )
                    }
                    else
                    {
                        print("Registration Succesfull")
                        self.TransitionHome()
                    }
                               
                }
       

    }
    func TransitionHome()
        {
                    let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as! HomeViewController
                    present(homeVC, animated: true)
                }
    

}
