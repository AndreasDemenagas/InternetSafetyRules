//
//  DetailsView.swift
//  InternetRules
//
//  Created by Andrew Demenagas on 9/2/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Futura", size: 48)
        lbl.textColor = .white
        lbl.text = "Rule 6:"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let ruleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "HelveticaNeue", size: 18)
        lbl.textColor = .white
        lbl.text = "Be careful while using e-commerce and e-banking services."
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let separatorLine: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
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
        return lbl
    }()
    
    let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        return btn
    }()
    
    var mainController: MainController?
    
    var rule: Rule? {
        didSet {
            ruleLabel.text = rule?.text
            titleLabel.text = rule?.id
            detailsLabel.text = rule?.details
        }
    }
    
    @objc func handleClose() {
        mainController?.handleCloseDetails()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .black
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 100, left: 50, bottom: 10, right: 50), size: .init(width: .zero, height: 60))
        
        addSubview(ruleLabel)
        ruleLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, size: .init(width: .zero, height: 70))
        
        addSubview(separatorLine)
        separatorLine.anchor(top: ruleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 50, left: 50, bottom: 0, right: 50), size: .init(width: .zero, height: 1))
        
        addSubview(detailsLabel)
        detailsLabel.anchor(top: separatorLine.bottomAnchor, leading: separatorLine.leadingAnchor, bottom: nil, trailing: separatorLine.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0), size: .init(width: .zero, height: 300))
        
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 10), size: .init(width: 70, height: 70))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
