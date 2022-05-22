//
//  RatingCell.swift
//  WeGoTripFeedback
//
//  Created by n3deep on 19.05.2022.
//

import UIKit

protocol RatingCellDelegate: AnyObject {
    func segmentedControlChanged(cell: RatingCell)
    func sliderChanged(cell: RatingCell)
}

class RatingCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var smileLabel: UILabel!
    @IBOutlet weak var segmentedControl: FeedbackSegmentedControl!
    @IBOutlet weak var slider: FeedbackSlider!
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        let segemnt = sender as! UISegmentedControl
        switch segemnt.selectedSegmentIndex {
        case 0:
            smileLabel.text = "😡"
        case 1:
            smileLabel.text = "🙁"
        case 2:
            smileLabel.text = "😐"
        case 3:
            smileLabel.text = "🙂"
        case 4:
            smileLabel.text = "😃"
        default:
            smileLabel.text = "😐"
        }
        delegate?.segmentedControlChanged(cell: self)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        
        /*
        guard let selectadValue = Int(roundedValue) else {
            return
        }
        */
         
        switch roundedValue {
        case 0:
            smileLabel.text = "😡"
        case 1:
            smileLabel.text = "🙁"
        case 2:
            smileLabel.text = "😐"
        case 3:
            smileLabel.text = "🙂"
        case 4:
            smileLabel.text = "😃"
        default:
            smileLabel.text = "😐"
        }
        
        delegate?.sliderChanged(cell: self)
    }
    
    weak var delegate: RatingCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    func setupUI() {
        self.selectionStyle = .none
        smileLabel.text = "😐"
        segmentedControl.selectedSegmentIndex = 2
        segmentedControl.isHidden = true

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
