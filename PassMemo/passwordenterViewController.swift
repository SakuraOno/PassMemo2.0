//
//  passwordenterViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/04/28.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit


class passwordenterViewController: UIViewController, UITextFieldDelegate {
    
    var isRegistered: Bool! {
        get {
            return (UIApplication.shared.delegate as! AppDelegate).isRegistered
        }
    }
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    // 入力してもらうユーザー名を入れる箱を用意する
    var userName: String!
    
    var userPassword: String!
    
    var userNameStored: String!
    
    var userPasswordStored: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
        //        userNameTextField.becomeFirstResponder()
        //     //   userNameTextField.resighFirstResponder()
        //
        //        userPasswordTextField.becomeFirstResponder()
        //     //   userPasswordTextField.resighFirstResponder()
        
        // デリゲート（移譲）を指定
        self.userNameTextField.delegate = self
        self.userPasswordTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isRegistered {
            return
        }
        
        if UserDefaults.standard.string(forKey: "userName") == nil || UserDefaults.standard.string(forKey: "userPassword") == nil {
            
            if self.presentedViewController is passwordsetViewController {
                return
            }
            
            let alert = UIAlertController(title: "アカウントがありません", message: "ユーザー登録をしてください", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: {
                (action) in
                self.dismiss(animated: true, completion: nil)
                
            }))
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:
                { (action) in
                    
                    let registerAccountViewCntroller = self.storyboard?.instantiateViewController(withIdentifier: "register") as! passwordsetViewController
                    self.present(registerAccountViewCntroller, animated: true, completion: nil)
                    
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func backbuttonTapped(_sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        userName = userNameTextField.text
        userPassword = userPasswordTextField.text
        userNameStored = UserDefaults.standard.string(forKey: "userName")
        userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if userName.isEmpty {
            let enterAlert = UIAlertController(title:"Alert", message: "必要事項を入力してください", preferredStyle:  UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default){
                
                //自販機で考えると引数はお金でジュースは戻り値byモンスター
                //以下は何もしないという処理
                action -> Void in
                
            }
            
            enterAlert.addAction(okAction)
            self.present(enterAlert, animated:true,completion:nil)
            
        }
        
        
        
        if userPassword.isEmpty {
            let enterAlert = UIAlertController(title:"Alert", message: "必要事項を入力してください", preferredStyle:  UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default){
                
                action -> Void in
                
            }
            
            enterAlert.addAction(okAction)
            self.present(enterAlert, animated:true,completion:nil)
            
        }
        
        if userName != userNameStored {
            let enterAlert = UIAlertController(title:"Alert", message: "入力事項が違います", preferredStyle:  UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default){
                
                action -> Void in
                
            }
            enterAlert.addAction(okAction)
            self.present(enterAlert, animated:true,completion:nil)
            
        }
        
        if userPassword != userPasswordStored {
            let enterAlert = UIAlertController(title:"Alert", message: "入力事項が違います", preferredStyle:  UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default){
                
                action -> Void in
                
            }
            enterAlert.addAction(okAction)
            self.present(enterAlert, animated:true,completion:nil)
            
        }
        
        
        if userNameStored == userName {
            
            if userPasswordStored == userPassword {
                
                // ログイン
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                //UserDefaults.standard.synchronize()
                //次の画面に遷移するコードを書く
                self.performSegue(withIdentifier: "next", sender: self)
            }
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        userNameTextField.resignFirstResponder()
        userPasswordTextField.resignFirstResponder()
        return true
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}
