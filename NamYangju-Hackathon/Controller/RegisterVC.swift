//
//  RegisterVC.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var passwordCheckField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    func setToolBar() {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.tabBarDonePressed))
        
        
        toolbar.setItems([flexibleSpace,doneBtn], animated: false)
        
        
        nameField.inputAccessoryView = toolbar
        passwordCheckField.inputAccessoryView = toolbar
    }
    
    @objc func tabBarDonePressed() {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setToolBar()
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func okButton(_ sender: Any) {
        guard let id = idField.text, !id.isEmpty else {
            return
        }
        guard let password = passwordField.text, !password.isEmpty else {
            return
        }
        guard let email = emailField.text, !email.isEmpty else {
            return
        }
        guard let username = nameField.text, !username.isEmpty else {
            return
        }
        print("Sended")
        API.send(id: id, password: password, email: email, username: username) { (user) in
            print(user)
        }
    }
    
}
