//
//  LoginViewController.swift
//  SampleFirebaseProj
//
//  Created by DDUKK7 on 22/11/22.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let emailTxt = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let passTxt = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: emailTxt, password: passTxt) {( AuthDataResult , error) in
                    if error != nil
                    {
                        print( error as Any )
                    }
                    else
                    {
                        print("Login Succesfull")
                        self.TransitionHome()
                    }
                               
                }
       

    }
    func TransitionHome()
        {
                    let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as! HomeViewController
                    present(homeVC, animated: true)
                }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
