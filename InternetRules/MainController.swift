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
    
    let detailsLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "HelveticaNeue", size: 18)
        lbl.textColor = .white
        lbl.text = "This quick game will make you familiar with the 10 Internet Safety & Security Rules as presented by the Greek CSI Institute. You will be shown a number of cards. Each card contains one rule. Make sure to read them carefully to understand them completetely! Browse safely!"
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .justified
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.alpha = 0
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
        btn.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupViews()
        
        
        //setupCards()
        //Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(setupBackground), userInfo: nil, repeats: false)
    }
    
    @objc fileprivate func handleStart() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            let padding: CGFloat = 10 + 20
            let x = self.view.frame.width - self.subtitleLabel.frame.width - (2 * padding)
            
            self.subtitleLabel.transform = CGAffineTransform(translationX: x, y: 0)
    
        }, completion: { (_) in
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                let padding: CGFloat = 10 + 20
                let x = self.view.frame.width - self.subtitleLabel.frame.width - (2 * padding)
                
                self.subtitleLabel.transform = CGAffineTransform(translationX: x, y: self.view.frame.height - 200)
                self.subtitleLabel.alpha = 0
                
                self.titleLabel.alpha = 0
                self.startButton.alpha = 0
                
            }, completion: { (_) in
                
                self.presentDetailsLabel()
                
            })
            
        })
    }
    
    func presentDetailsLabel() {
    
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseIn, animations: {
            
            self.detailsLabel.alpha = 1
            
        }) { (_) in
            
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (_) in
                
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
                    
                    self.detailsLabel.alpha = 0
                    
                }) { (_) in
                    
                    print("Game intro complete...")
                    
                }
            }
        }
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
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 10, bottom: 0, right: 0), size: .init(width: 240, height: 25))
        
        view.addSubview(startButton)
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(detailsLabel)
        detailsLabel.heightAnchor.constraint(equalToConstant: 180).isActive = true
        detailsLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        detailsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

