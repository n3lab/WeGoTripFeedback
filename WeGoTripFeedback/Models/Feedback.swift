//
//  Feedback.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import Foundation

struct Feedback: Codable {
    var id: UUID
    
    var totalRating: Int
    var guideRating: Int
    var informationRating: Int
    var navigationRating: Int
    
    var feedbackMessage: String?
    var wishMessage: String?
}
