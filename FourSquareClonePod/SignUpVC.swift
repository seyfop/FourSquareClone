//
//  ViewController.swift
//  FourSquareClonePod
//
//  Created by Seyfo on 9.02.2023.
//

import UIKit
import Parse

class SignUpVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        /*let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = ["Banana"]
        parseObject["calories"] = 150
        parseObject.saveInBackground { success, error in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                print("uploaded")
            }
        }
        
        let query = PFQuery(className: "Fruits")
        //query.whereKey("name", equalTo: "Apple")
        query.whereKey("calories", greaterThan: 120)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                print(objects)
                */
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
             view.addGestureRecognizer(gestureRecognizer)
         }
         
         @objc func hideKeyboard () {
             view.endEditing(true)
         }

    
    @IBAction func signInClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!) { user, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    //Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                    
                }
                
            }
            
            
            
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
        }
        
        
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                    
                    
                }
            }
            
            
            
        
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username / Password??")
            
        }
    }
    func makeAlert (titleInput:String, messageInput:String) {
        let alert = UIAlertController(title:titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
        
    }
}
 
    



