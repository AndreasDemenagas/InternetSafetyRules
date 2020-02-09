//
//  DetailsView.swift
//  InternetRules
//
//  Created by Andrew Demenagas on 9/2/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {
    
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
        lbl.textAlignment = .justified
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
    
    var rule: Rule? {
        didSet {
            ruleLabel.text = rule?.text
            titleLabel.text = rule?.id
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 175, left: 50, bottom: 10, right: 50), size: .init(width: .zero, height: 60))
        
        view.addSubview(ruleLabel)
        ruleLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, size: .init(width: .zero, height: 50))
        
        view.addSubview(separatorLine)
        separatorLine.anchor(top: ruleLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 50, left: 50, bottom: 0, right: 50), size: .init(width: .zero, height: 1))
        
        view.addSubview(detailsLabel)
        detailsLabel.anchor(top: separatorLine.bottomAnchor, leading: separatorLine.leadingAnchor, bottom: nil, trailing: separatorLine.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 0), size: .init(width: .zero, height: 300))
    }
    
}
