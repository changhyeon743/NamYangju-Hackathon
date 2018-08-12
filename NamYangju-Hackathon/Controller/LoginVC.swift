//
//  LoginVC.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import UIKit
import Alertift

class LoginVC: UIViewController {
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        guard let id = idField.text,!id.isEmpty else {
            return
        }
        guard let password = passwordField.text,!password.isEmpty else {
            return
        }
        self.view.endEditing(true)
        API.login(id: id, password: password) { (ok) in
            
            if ok {
                let user = User(id: id, password: password, email: "hello@com", name: "이창현")
                self.setCurrentUser(with: user)
                self.performSegue(withIdentifier: "login", sender: self)
            } else {
                self.msg()
            }
        }
        
    }
    func setCurrentUser(with: User) {
        currentUser = with
    }
    func msg() {
        Alertift.alert(title: "오류", message: "아이디나 비밀번호가 틀렸습니다.")
            .action(.default("확인"))
            .show(on:self)
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
