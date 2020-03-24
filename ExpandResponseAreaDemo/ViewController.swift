//
//  ViewController.swift
//  ExpandResponseAreaDemo
//
//  Created by mmh on 2020/3/24.
//  Copyright © 2020 mmh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
    }

    @objc func clicked() {
        print("我被点击啦~~~~~~~~~~~~~~~~~~~~")
    }
    
    fileprivate lazy var button: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect(x: 0, y: 100, width: 30, height: 30)
        btn.expandClickArea = ExpandEdgeInsets.init(edge: 500)
        btn.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        return btn
    }()

}


