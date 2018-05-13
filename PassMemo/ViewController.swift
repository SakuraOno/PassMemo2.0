//
//  ViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/04/16.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit;


class ViewController: UIViewController {
    
    @IBAction func userset () {
        
    }
    
    @IBAction func start(_ sender: Any) {
        
        self.performSegue(withIdentifier: "aaa", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unWindSegue(sender: UIStoryboardSegue) {
        
    }
    
}

