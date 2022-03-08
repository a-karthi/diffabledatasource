//
//  HomeViewController.swift
//  diffables
//
//  Created by @karthi on 08/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dataSourceBtnAction(_ sender:UIButton)  {
        let vc = TableViewController.initWithStory()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func collectionBtnAction(_ sender:UIButton)  {
        let vc = CollectionViewController.initWithStory()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    // MARK: - Navigation

     class func initWithStory() -> HomeViewController {
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
         return vc
     }

}
