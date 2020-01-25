//
//  ViewController.swift
//  InternetRules
//
//  Created by Andrew Demenagas on 25/1/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Internet Rules"

        
        view.backgroundColor = .white
        
        let rules = Bundle.main.decode(type: [Rule].self, from: "rules.json")
        
        for rule in rules {
            print(rule.text)
        }
    }


}

