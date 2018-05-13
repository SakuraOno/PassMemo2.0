//
//  DetailViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/05/13.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel :UILabel!
    @IBOutlet weak var passwordLabel :UILabel!
    @IBOutlet weak var memoLabel :UILabel!
    
    var wordDic: Dictionary<String, String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = wordDic["name"]
        self.passwordLabel.text = wordDic["password"]
        self.memoLabel.text = wordDic["memo"]
        
        // Do any additional setup after loading the view.
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
