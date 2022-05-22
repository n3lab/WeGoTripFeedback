//
//  FeedbackSlider.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 22.05.2022.
//

import UIKit

class FeedbackSlider: UISlider {

    override func draw(_ rect: CGRect) {
        self.minimumValue = 0
        self.maximumValue = 4
        self.value = 2
        self.tintColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        self.minimumTrackTintColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        self.maximumTrackTintColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
    }

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.trackRect(forBounds: bounds)
        rect.size.height = 1
        return rect
    }
}
