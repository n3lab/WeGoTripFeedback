//
//  FeedbackMessageViewModel.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import Foundation
import Combine

enum SendFeedbackResult {
    case success
    case error
}

protocol FeedbackMessageViewModeling {
    var feedback: Feedback? { get set }
    var avatarURLString: String? { get set }
    
    var sendFeedbackResultPublisher: Published<SendFeedbackResult?>.Publisher { get }
    
    func sendFeedback()
}

class FeedbackMessageViewModel: FeedbackMessageViewModeling, ObservableObject {
    var avatarURLString: String?
    var feedback: Feedback?
    private let apiService: ApiServicing = ServiceLocator.apiService
    
    var sendFeedbackResultPublisher: Published<SendFeedbackResult?>.Publisher { $sendFeedbackResult }
    
    @Published var sendFeedbackResult: SendFeedbackResult?
    
    func sendFeedback() {
        guard let feedback = feedback else {
            return
        }

        apiService.sendFeedback(feedback, onSuccess: {
            print("feedback sent: \(String(describing: self.feedback))")
            self.sendFeedbackResult = .success
        }, onFailure: { error in
            print(error)
            self.sendFeedbackResult = .error
        })
    }
}
