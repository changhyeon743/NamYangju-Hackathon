//
//  DetailVC.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var titleText:String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    var detail:String = "" {
        didSet {
            detailLabel.text = detail
        }
    }
    
    var image:UIImage = #imageLiteral(resourceName: "temp.jpg") {
        didSet {
            imageView.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isMotionEnabled = true
        setAnimation()
        // Do any additional setup after loading the view.
    }
    func setAnimation() {
        imageView.motionIdentifier = "foo"
        titleLabel.motionIdentifier = "bar"

    }
    
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true) {
            return
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
