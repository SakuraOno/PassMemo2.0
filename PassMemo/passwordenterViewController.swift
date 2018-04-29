//
//  passwordenterViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/04/28.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class passwordenterViewController: UIViewController {
    

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userName = userNameTextField.text;
        let userPassword = userPasswordTextField.text;
        let userNameStored = UserDefaults.standard.string(forKey: "userName")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        if(userNameStored == userName){
            
            if(userPasswordStored == userPassword){
                
                // ログイン
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                //UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion:nil)
                
            }
            
        }
        
    }
    
}
