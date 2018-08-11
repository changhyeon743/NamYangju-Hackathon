//
//  ViewController.swift
//  NamYangju-Hackathon
//
//  Created by 이창현 on 2018. 8. 11..
//  Copyright © 2018년 이창현. All rights reserved.
//

import UIKit
import Motion

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    
    private let refreshControl = UIRefreshControl() 
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    func setToolBar() {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.tabBarDonePressed))
        
        
        toolbar.setItems([flexibleSpace,doneBtn], animated: false)
        
        
        textField.inputAccessoryView = toolbar
        
    }
    
    @objc func tabBarDonePressed() {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isMotionEnabled = true
        
        setToolBar()
        

        collectionView.register(UINib(nibName: "FeedCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view, typically from a nib.
        
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Data ...")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        
    }
    @objc func refresh(_ sender:Any) {
        
        API.fetch_posts(completion: { (posts) in
            API.setItems(posts: posts)
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        })
        
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        API.fetch_posts(title: textField.text ?? "무제",completion: { (posts) in
            API.setItems(posts: posts)
            self.collectionView.reloadData()
            self.view.endEditing(true)
        })
    }
    
}



extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-60, height: view.frame.height - 180)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FeedCell
        cell.title = items[indexPath.row].title
        cell.image = #imageLiteral(resourceName: "temp.jpg")
        cell.like = items[indexPath.row].good
        
        //cell.backgroundColor = randomColor()
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }
    
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! FeedCell
        
        cell.imageView.motionIdentifier = "foo"
        cell.textLabel.motionIdentifier = "bar"
        
        
        
        let viewController:DetailVC = UIStoryboard(name: "Feed", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        
        present(viewController, animated: true) {
            viewController.detail = items[indexPath.row].content
            viewController.titleText = items[indexPath.row].title
        }
        
        //cell.resize(to:CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width))
    }
    
    
    
}
