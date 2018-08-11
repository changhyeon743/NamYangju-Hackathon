//
//  FeedCell.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var title:String = "" {
        didSet {
            textLabel.text = title
        }
    }
    var image:UIImage = #imageLiteral(resourceName: "temp.jpg") {
        didSet {
            imageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.layer.shadowOffset = CGSize(width: 5, height: 5)
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOpacity = 0.4
//        self.layer.shadowRadius = 1.4
//        self.layer.masksToBounds = false
//
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
    }
    
    func resize(to:CGRect) {
        UIView.animate(withDuration: 1) {
            self.frame = to
        }
        
    }

}
