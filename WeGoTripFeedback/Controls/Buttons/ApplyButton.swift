//
//  ApplyButton.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import UIKit

class ApplyButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.tintColor = UIColor.white
        self.backgroundColor = UIColor(red: 87/255, green: 78/255, blue: 238/255, alpha: 1)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
