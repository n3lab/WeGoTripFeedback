//
//  FeedbackRatingController.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import UIKit
import Kingfisher
import FittedSheets

protocol FeedbackRatingControllerDelegate: AnyObject {
    func presentFeedbackMessageController(feedback: Feedback, avatarURL: String)
}

class FeedbackRatingController: UIViewController {

    @IBOutlet weak var nextButton: ApplyButton!
    @IBOutlet weak var dismissButton: DiscardButton!
    @IBOutlet weak var avatarImageView: AvatarImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingTableView: UITableView!
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.presentFeedbackMessageController(feedback: viewModel.feedback, avatarURL: viewModel.avatarURLString)
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var viewModel: FeedbackRatingViewModeling = ServiceLocator.feedbackRatingViewModel
    weak var delegate: FeedbackRatingControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        
        ratingTableView.delegate = self
        ratingTableView.dataSource = self
        ratingTableView.separatorStyle = .none
        
        let ratingCellNib = UINib(nibName: "RatingCell", bundle: nil)
        ratingTableView.register(ratingCellNib, forCellReuseIdentifier: "RatingCell")

        titleLabel.text = "Офигенно, вы дошли до конца!\n Расскажите, как вам?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nextButton.setTitle("Далее", for: .normal)
        dismissButton.setTitle("Не хочу отвечать", for: .normal)
        
        if let url = URL(string: viewModel.avatarURLString) {
            avatarImageView.kf.setImage(with: url)
        }
    }
}

extension FeedbackRatingController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingCell", for: indexPath) as! RatingCell
        cell.delegate = self
        
        switch indexPath.row {
        case 0:
            cell.questionLabel.text = "Как вам тур в целом?"
        case 1:
            cell.questionLabel.text = "Понравился Гид?"
        case 2:
            cell.questionLabel.text = "Как вам подача информации?"
        case 3:
            cell.questionLabel.text = "Удобная навигация между шагами?"
        default:
            return UITableViewCell()
        }
        
        return cell
    }
}

extension FeedbackRatingController: RatingCellDelegate {
    func segmentedControlChanged(cell: RatingCell) {
        guard let indexPath = ratingTableView.indexPath(for: cell) else {
            return
        }

        print("Switch changed on row \(indexPath.row)")
        print("selected state: \(cell.segmentedControl.selectedSegmentIndex)")
        
        let value = cell.segmentedControl.selectedSegmentIndex + 1
        
        switch indexPath.row {
        case 0:
            viewModel.feedback.totalRating = value
        case 1:
            viewModel.feedback.guideRating = value
        case 2:
            viewModel.feedback.informationRating = value
        case 3:
            viewModel.feedback.navigationRating = value
        default:
            return
        }
    }
    
    func sliderChanged(cell: RatingCell) {
        guard let indexPath = ratingTableView.indexPath(for: cell) else {
            return
        }

        print("Switch changed on row \(indexPath.row)")
        print("selected state: \(cell.segmentedControl.selectedSegmentIndex)")
        
        let value = Int(cell.slider.value) + 1
        
        switch indexPath.row {
        case 0:
            viewModel.feedback.totalRating = value
        case 1:
            viewModel.feedback.guideRating = value
        case 2:
            viewModel.feedback.informationRating = value
        case 3:
            viewModel.feedback.navigationRating = value
        default:
            return
        }
    }
}
