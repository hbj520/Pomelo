//
//  UIViewConttroller+Extensions.swift
//  PodsDownloadTest
//
//  Created by Bron on 2020/6/17.
//  Copyright © 2020 Bron. All rights reserved.
//

import Foundation
import UIKit
public extension UIViewController {
   public func showTestView(){
        let testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        UIApplication.shared.windows[0].rootViewController?.view.addSubview(testView)
    }
}
