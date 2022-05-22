//
//  ServiceLocator.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import Foundation

final class ServiceLocator {
    static let feedbackRatingViewModel: FeedbackRatingViewModeling = FeedbackRatingViewModel()
    static let feedbackMessageViewModel: FeedbackMessageViewModeling = FeedbackMessageViewModel()
    static let apiService: ApiServicing = ApiService.shared
}
