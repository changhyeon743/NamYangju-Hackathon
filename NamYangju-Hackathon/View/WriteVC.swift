//
//  WriteVC.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import UIKit

class WriteVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setToolBar()
        // Do any additional setup after loading the view.
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
        
        
        textView.inputAccessoryView = toolbar
    }
    
    //MARK:- @objc func
    @objc func tabBarDonePressed() {
        self.view.endEditing(true)
    }
}
