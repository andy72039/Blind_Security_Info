//
//  ServerTableViewCell.swift
//  Blind_Security_Info
//
//  Created by Nick on 07/10/2017.
//  Copyright © 2017 Nick. All rights reserved.
//

import Foundation
import UIKit

class ServerTableViewCell: UITableViewCell {
    let labelOne = UILabel()
    let labelTwo = UILabel()
    let labelThree = UILabel()
    let addButton: UIButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelTwo.textColor = UIColor.gray
        labelThree.textColor = UIColor.gray
        
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelThree.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action:#selector(addButtonPressed), for: .touchUpInside)
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = UIColor.blue
        
        contentView.addSubview(labelOne)
        contentView.addSubview(labelTwo)
        contentView.addSubview(labelThree)
        contentView.addSubview(addButton)
        
        let viewsDict = [
            "lbOne" : labelOne,
            "lbTwo" : labelTwo,
            "lbThree" : labelThree,
            "addbtn": addButton
            ] as [String : Any]
        
        // Vertical
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[lbOne(20)]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lbThree]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[lbOne]-[lbTwo]-|", options: [], metrics: nil, views: viewsDict))
        
        // Horizonal
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[lbOne]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[lbTwo]-[lbThree]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[addbtn]-|", options: [], metrics: nil, views: viewsDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addButtonPressed() {
        
    }
}
