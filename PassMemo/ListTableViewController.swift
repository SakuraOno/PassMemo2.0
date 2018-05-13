//
//  ListTableViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/05/10.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    //セクション数を指定
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの個数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    //セルの中身の表示の内容設定
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary = wordArray[indexPath.row]
        
        cell.nameLabel.text = nowIndexPathDictionary["name"]
        cell.passwordLabel.text = nowIndexPathDictionary["password"]
        
        return cell
    }
    
    //タップした時の処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 次の画面へ移動
        performSegue(withIdentifier: "next", sender: wordArray[indexPath.row])
    }
    
    //prepareは遷移するときにデータを渡すメソッド
    //funcって書いてるのはメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //
        let detailVC = segue.destination as! DetailViewController
        
        // ラベルのインスタンス作成のため
        detailVC.nameLabel.text = (sender as! Dictionary<String, String>)["name"]
        detailVC.passwordLabel.text = (sender as! Dictionary<String, String>)["password"]
         detailVC.memoLabel.text = (sender as! Dictionary<String, String>)["memo"]
    
    }
    
    func ListtableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            wordArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            self.saveData.removeObject(forKey: "PassMemo")
            
            self.wordArray.remove(at: indexPath.row)
            self.saveData.set(self.wordArray, forKey: "PassMemo")
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }
        
        deleteButton.backgroundColor = UIColor.red
        
        return [deleteButton]
    }
    
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if saveData.array(forKey: "PassMemo") != nil {
            
            wordArray = saveData.array(forKey: "PassMemo") as! [Dictionary<String, String>]
            
        }
        
        tableView.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
