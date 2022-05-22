//
//  FeedbackMessageController.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import UIKit
import Combine

class FeedbackMessageController: UIViewController {

    @IBOutlet weak var saveButton: ApplyButton!
    @IBOutlet weak var skipButton: DiscardButton!
    @IBOutlet weak var avatarImageView: AvatarImageView!
    @IBOutlet weak var firstQuestionLabel: UILabel!
    @IBOutlet weak var secondQuestionLabel: UILabel!
    @IBOutlet weak var firstQuestionTextView: UITextView!
    @IBOutlet weak var secondQuestionTextView: UITextView!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        viewModel.feedback?.feedbackMessage = firstQuestionTextView.text
        viewModel.feedback?.wishMessage = secondQuestionTextView.text
        viewModel.sendFeedback()
    }
    
    @IBAction func skipButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var viewModel: FeedbackMessageViewModeling = ServiceLocator.feedbackMessageViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }

    func setupUI() {
                
        firstQuestionLabel.text = "Что вам особенно понравилось в этом туре?"
        secondQuestionLabel.text = "Как мы могли бы улучшить подачу информации?"
        firstQuestionLabel.font = UIFont.systemFont(ofSize: 18)
        secondQuestionLabel.font = UIFont.systemFont(ofSize: 18)
        
        firstQuestionTextView.text = ""
        secondQuestionTextView.text = ""
        
        firstQuestionTextView.placeholder = "Напишите здесь, чем вам запомнился тур, посоветуете ли его друзьям и как, удалось ли повеселиться?"
        secondQuestionTextView.placeholder = "Напишите здесь, чем вам запомнился тур, посоветуете ли его друзьям и как, удалось ли повеселиться?"
        
        saveButton.setTitle("Сохранить отзыв", for: .normal)
        skipButton.setTitle("Пропустить", for: .normal)
        
        let url = URL(string: viewModel.avatarURLString ?? "")
        avatarImageView.kf.setImage(with: url)
    }
    
    func bindViewModel() {
        viewModel.sendFeedbackResultPublisher
            .receive(on: RunLoop.main)
            .sink { (sendFeedbackResult) in
                switch sendFeedbackResult {
                case .success:
                    self.showAlert("Отзыв успешно отправлен!")
                case .error:
                    self.showAlert("При отправке отзыва произошла ошибка")
                case .none:
                    self.showAlert("При отправке отзыва произошла ошибка")
                }
            }.store(in: &subscriptions)
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "WeGoTrip", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ОК", style: UIAlertAction.Style.default, handler: {_ in
            self.dismissVC()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
