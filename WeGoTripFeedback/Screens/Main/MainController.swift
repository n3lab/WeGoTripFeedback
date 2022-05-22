//
//  MainController.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import UIKit
import FittedSheets

class MainController: UIViewController {

    @IBOutlet weak var feedbackButton: ApplyButton!
    
    @IBAction func feedbackButtonPressed(_ sender: Any) {
        var options = SheetOptions()
        options.shrinkPresentingViewController = false

        let feedbackRatingController = FeedbackRatingController()
        feedbackRatingController.delegate = self
        let sheetController = SheetViewController(controller: feedbackRatingController, sizes: [.fixed(750)], options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.gripColor = .clear
                
        self.present(sheetController, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        feedbackButton.setTitle("Оставить отзыв", for: .normal)
    }
}

extension MainController: FeedbackRatingControllerDelegate {
    func presentFeedbackMessageController(feedback: Feedback, avatarURL: String) {
        let feedbackMessageController = FeedbackMessageController()
        feedbackMessageController.viewModel.feedback = feedback
        feedbackMessageController.viewModel.avatarURLString = avatarURL

        var options = SheetOptions()
        options.shrinkPresentingViewController = false

        let sheetController = SheetViewController(controller: feedbackMessageController, sizes: [.fixed(750)], options: options)
        sheetController.allowPullingPastMaxHeight = false
        sheetController.gripColor = .clear
        
        self.present(sheetController, animated: true, completion: nil)
    }
}
