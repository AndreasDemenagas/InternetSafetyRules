//
//  CardView.swift
//  InternetRules
//
//  Created by Andrew Demenagas on 26/1/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class CardView: UIView {

    let label: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .justified
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var rule: Rule? {
        didSet {
            label.text = rule?.text
        }
    }
    
    var mainController: MainController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.cornerRadius = 20
        isUserInteractionEnabled = false 
        
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
        setupLabel()
    }
    
    fileprivate func setupLabel() {
        addSubview(label)
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        guard let view = superview else { return }
        guard let card = sender.view as? CardView else { return }
        let point = sender.translation(in: view)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        let xFromCenter = card.center.x - view.center.x
        let divisor = view.frame.width / 2 / 0.61
        let scale = min(100/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor).scaledBy(x: scale, y: scale)
        
        if sender.state == .ended {
            
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.3) {
                    guard let rule = self.rule else { return }
                    self.mainController?.animateDetailsIn(with: rule)
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            }
            
            if card.center.x > view.frame.width - 75 {
                UIView.animate(withDuration: 0.3) {
                    print("next card...")
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            }
            
            UIView.animate(withDuration: 0.2) {
                card.center = view.center
                card.transform = .identity
            }
            
        }
    }
}

//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.5
//        layer.shadowOffset = .zero
//        layer.shadowRadius = 10
