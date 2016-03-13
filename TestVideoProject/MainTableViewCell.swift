//
//  MainTableViewCell.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell, ChangeableTableViewCell {
    
    @IBOutlet var previewButton: UIButton?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var durationLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    
    var changeableTableViewCellDelegate: ChangeableTableViewCellDelegate?
    
    @IBAction private func previewButtonPressed(sender: UIButton) {
        self.changeableTableViewCellDelegate?.changeableTableViewCellDidChange(self)
    }
}
