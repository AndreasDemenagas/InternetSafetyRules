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
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Futura", size: 48)
        lbl.textColor = .white
        lbl.text = "10 Internet Rules"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "HelveticaNeue", size: 18)
        lbl.textColor = .white
        lbl.text = "For  Online Safety & Security"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let startButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor.init(r: 51, g: 153, b: 255)
        btn.setTitle("Start", for: .normal)
        btn.setTitleColor( .white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupViews()
        
        
        //setupCards()
        //Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(setupBackground), userInfo: nil, repeats: false)
    }
    
    @objc fileprivate func setupBackground() {
        UIView.animate(withDuration: 2) {
            self.view.backgroundColor = .white
        }
    }
    
    fileprivate func setupCards() {
        view.addSubview(cardView)
        cardView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func setupViews() {
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 200, left: 20, bottom: 0, right: 20), size: .init(width: .zero, height: 50))
        
        view.addSubview(subtitleLabel)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: .init(top: 8, left: 10, bottom: 0, right: 0), size: .init(width: .zero, height: 25))
        
        view.addSubview(startButton)
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

