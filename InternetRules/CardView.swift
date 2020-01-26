//
//  CardView.swift
//  InternetRules
//
//  Created by Andrew Demenagas on 26/1/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        isUserInteractionEnabled = false 
        
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
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
                    print("swipe left")
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            }
            
            if card.center.x > view.frame.width - 75 {
                UIView.animate(withDuration: 0.3) {
                    print("swipe right")
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
