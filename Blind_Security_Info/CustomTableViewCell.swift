//
//  CustomTableViewCell.swift
//  Blind_Security_Info
//
//  Created by Nick on 15/09/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    let labelOne = UILabel()
    let labelTwo = UILabel()
    let labelThree = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelTwo.textColor = UIColor.gray
        labelThree.textColor = UIColor.gray
        
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelOne)
        contentView.addSubview(labelTwo)
        contentView.addSubview(labelThree)
        
        let viewsDict = [
            "lbOne" : labelOne,
            "lbTwo" : labelTwo,
            "lbThree" : labelThree,
            ] as [String : Any]
        
        // Vertical
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[lbOne(20)]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lbThree]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[lbOne]-[lbTwo]-|", options: [], metrics: nil, views: viewsDict))
        
        // Horizonal
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[lbOne]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[lbTwo]-[lbThree]-|", options: [], metrics: nil, views: viewsDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
