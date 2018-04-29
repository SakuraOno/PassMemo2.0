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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if(userPassword != userRepeatPassword)
        {
            displayMyAlertMessage(userMessage: "パスワードが一致していません。")
            return
        }
        
        // データ登録
        UserDefaults.standard.set(userName, forKey:"userName")
        UserDefaults.standard.set(userPassword, forKey:"userPassword")
        //UserDefaults.standard.synchronize();
        
        // メッセージアラートなど
        let myAlert = UIAlertController(title:"Alert", message: "登録完了", preferredStyle:  UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default){
            action in self.dismiss(animated: true, completion:nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true,completion:nil)
        
    }
    
    func displayMyAlertMessage(userMessage: String){
        
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:  UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil)
        myAlert.addAction(okAction);
        self.present(myAlert,animated:true, completion:nil)
        
    }
    
}

