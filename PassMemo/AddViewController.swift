//
//  AddViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/04/17.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var memoTexetField: UITextField!
    
    let saveData = UserDefaults.standard
    
    var wordArray: [Dictionary<String, String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if saveData.array(forKey: "PassMemo") != nil {
            wordArray = saveData.array(forKey: "PassMemo") as! [Dictionary<String, String>]
        
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    @IBAction func saveWord() {
        
        if (memoTexetField.text?.isEmpty)! {
            
        }
        
        let wordDictionary = ["name": titleTextField.text!, "password": passwordTextField.text!, "memo": memoTexetField.text!]
        
        //内容が入力されなかったら失敗のアラート
        if wordDictionary["name"] == "" || wordDictionary["password"] == "" {
            
            let alert = UIAlertController(
                title: "保存失敗",
                message: "パスワードの登録に失敗しました",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(
                title: "完了",
                style: .default,
                handler: {(action) in
                    self.navigationController?.popToRootViewController(animated: true)
            }
            ))
            
            self.present(alert, animated: true, completion: nil)
            
            return
            
        }
        
        wordArray.append(wordDictionary)
        
        saveData.set(wordArray, forKey: "PassMemo")
        
        let alert = UIAlertController(title: "保存完了", message: "パスワードの登録が完了しました", preferredStyle: .alert)
      
        //何もしない処理すらも書かない
        //addActionはアラートにボタンを加える処理
        //ShowはPopで戻る
        alert.addAction(UIAlertAction(title: "完了", style: .default, handler: { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        ))
        
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
            titleTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
            memoTexetField.resignFirstResponder()
            return true
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
