//
//  passwordsetViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/04/27.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class passwordsetViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    var isRegistered: Bool! {
        get {
            return (UIApplication.shared.delegate as! AppDelegate).isRegistered
        }
        set {
            (UIApplication.shared.delegate as! AppDelegate).isRegistered = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        // 空白確認
        if(userName == "" || userPassword == "" || userRepeatPassword == ""){
            //アラートメッセージ
            displayMyAlertMessage(userMessage: "全てのフォームに入力してください")
            return
        }
        
        //パスワード一致確認
        if(userPassword == userRepeatPassword) {
            
            // データ登録
            UserDefaults.standard.set(userName, forKey:"userName")
            UserDefaults.standard.set(userPassword, forKey:"userPassword")
            //UserDefaults.standard.synchronize();
            
            // メッセージアラートなど
            let myAlert = UIAlertController(title:"Alert", message: "登録完了", preferredStyle:  UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default) {
                action in
                
                self.isRegistered = true
                
                self.presentingViewController?.presentingViewController?.navigationController?.dismiss(animated: false, completion: nil)
                
            }
            
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true,completion:nil)
            
        } else {
            
            displayMyAlertMessage(userMessage: "パスワードが一致していません。")
            
            return
        }
        
    }
    
     @IBAction func backButtonTapped(_ sender: Any) {
        
        if self.presentingViewController is passwordenterViewController {
            self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
            return
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion:nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

