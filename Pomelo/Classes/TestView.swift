//
//  TestView.swift
//  PodsDownloadTest
//
//  Created by Bron on 2020/6/17.
//  Copyright © 2020 Bron. All rights reserved.
//

import UIKit

public class TestView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
