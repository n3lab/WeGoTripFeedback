//
//  AvatarImageView.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import UIKit

class AvatarImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentMode = .scaleAspectFill
        self.backgroundColor = UIColor.lightGray
        self.layer.cornerRadius = self.bounds.height/2
        self.clipsToBounds = true
    }
}
