//
//  ViewController.swift
//  InternetRules
//
//  Created by Andrew Demenagas on 25/1/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    let rules = Bundle.main.decode(type: [Rule].self, from: "rules.json")
    
    let cardView = CardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Internet Rules"
        view.backgroundColor = .lightGray
        
        setupCards()
    }
    
    fileprivate func setupCards() {
        view.addSubview(cardView)
        cardView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        print(0000)
    }


}

