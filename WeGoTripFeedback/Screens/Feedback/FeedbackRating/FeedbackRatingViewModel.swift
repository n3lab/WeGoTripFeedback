//
//  File.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import Foundation

protocol FeedbackRatingViewModeling {
    var feedback: Feedback { get set }
    var avatarURLString: String { get }
}

class FeedbackRatingViewModel: FeedbackRatingViewModeling {
    var avatarURLString: String = "https://app.wegotrip.com/media/users/1/path32.png"
    
    var feedback: Feedback = Feedback(id: UUID(), totalRating: 3, guideRating: 3, informationRating: 3, navigationRating: 3, feedbackMessage: nil, wishMessage: nil)
}
