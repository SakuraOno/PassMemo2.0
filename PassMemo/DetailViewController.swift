//
//  DetailViewController.swift
//  PassMemo
//
//  Created by 小野　櫻 on 2018/04/17.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var sampleButton: UIButton!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            let timestamp = (detail.value("timeStamp")! as AnyObject).description
            if let label = self.detailDescriptionLabel {
                label.text = timestamp
            }
            self.detailDescriptionLabel.text = timestamp
            self.sampleButton.isEnabledisEnabled = true
            self.view.isUserInteractionEnabled  = true
            self.navigationItem.title = timestamp
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.isUserInteractionEnabled  = false
        self.navigationItem.title = "選択されていません"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
