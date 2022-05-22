//
//  DiscardButton.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import UIKit

class DiscardButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.tintColor = UIColor.gray
        self.backgroundColor = UIColor.clear
        self.clipsToBounds = true
    }
}
