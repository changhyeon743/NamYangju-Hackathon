//
//  WriteVC.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import UIKit
import Alertift


class WriteVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToolBar()
        // Do any additional setup after loading the view.
    }

    @IBAction func okButtonPressed(_ sender: UIButton) {
        API.upload_post(title: nameField.text ?? "무제", content: textView.text, completion: { (bool) in
            Alertift.alert(title: "성공", message: "게시물을 올렸습니다. 확인해보세요. ><")
                .action(.default("확인"))
                .show(on:self)
        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setToolBar() {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.tabBarDonePressed))
        
        
        toolbar.setItems([flexibleSpace,doneBtn], animated: false)
        
        nameField.inputAccessoryView = toolbar
        textView.inputAccessoryView = toolbar
    }
    
    //MARK:- @objc func
    @objc func tabBarDonePressed() {
        self.view.endEditing(true)
    }
}
