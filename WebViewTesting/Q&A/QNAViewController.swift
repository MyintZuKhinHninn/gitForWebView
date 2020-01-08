//
//  QNAViewController.swift
//  WebViewTesting
//
//  Created by TechFun on 6/7/19.
//  Copyright © 2019 TechFun. All rights reserved.
//

import UIKit

class QNAViewController: commonViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackButton()
    }
    
    func setBackButton(){
        let backButton = UIButton(type: .custom)
        backButton.setTitleColor(.white, for: .normal) // You can change the TitleColor
        backButton.addTarget(self, action: #selector(self.pressBack(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc func pressBack(_ sender: UIButton){
        self.back()
    }
}
