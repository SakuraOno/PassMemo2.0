//
//  AddViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/04/17.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var memoTexetField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func saveWord() {
        
        let wordDictionary = ["name": titleTextField.text!, "password": passwordTextField.text!,"memo":memoTexetField.text!]
        
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
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "パスワードの登録が完了しました",
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
        titleTextField.text = ""
        passwordTextField.text = ""
        
        
        
    }
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


