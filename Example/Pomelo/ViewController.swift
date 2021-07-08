//
//  ViewController.swift
//  Pomelo
//
//  Created by hbjmailformac@163.com on 07/06/2021.
//  Copyright (c) 2021 hbjmailformac@163.com. All rights reserved.
//

import UIKit
import Pomelo
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        BronTest.showMessage()
        self.showTestView()
        self.loadFullScreenVideoAd(slotId: "ff").subscribeNext { (status) in
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

