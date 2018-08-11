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
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
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
    var like:Int = 0 {
        didSet {
            likeLabel.text = "\(like)개의 관심"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor,UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.addSublayer(gradientLayer)
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
