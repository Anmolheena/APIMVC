//
//  ViewController.swift
//  APIMVC
//
//  Created by Appinventiv-PC on 20/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{
    // Mark :- variables
 var parameterDictionary :[String:Any] = [:]
   var parameterDictionary2 :[String:[Any]] = [:]
  //  let Parameters = ["username":"name","password":"anmol123"]
   
    // Mark :- outlets
     @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var dateOFBirthTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Mark :- viewwillappear for animtaion
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.center.x  -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
    dateOFBirthTextField.center.x -= view.bounds.width

    }
    //Mark :- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        dateOFBirthTextField.delegate = self
       
    }
    // Mark :- SininButton action
    @IBAction func signInButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations:{
            self.usernameTextField.center.x  += self.view.bounds.width
            self.passwordTextField.center.x += self.view.bounds.width
        }, completion:nil )
         parameterDictionary[usernameTextField.text!] = usernameTextField.text
         parameterDictionary[passwordTextField.text!] = passwordTextField.text
        APIControllerClass().singup(Parameters: parameterDictionary) { (user) in
          print (user.password)
           print(user.username)
            
        }}
    

    // Mark :- signUpButton Action
    @IBAction func signUpButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations:{
        self.usernameTextField.center.x  += self.view.bounds.width
        self.passwordTextField.center.x += self.view.bounds.width
            self.dateOFBirthTextField.center.x += self.view.bounds.width
    }, completion:nil )
        parameterDictionary2[usernameTextField.text!] = [passwordTextField.text ?? "no value",dateOFBirthTextField.text ?? "dateofbirth is empty"]
}
    }

