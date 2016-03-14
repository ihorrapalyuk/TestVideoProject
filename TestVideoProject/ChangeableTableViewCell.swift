//
//  ChangableTableViewCell.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import Foundation

protocol ChangeableTableViewCell {
    
    var changeableTableViewCellDelegate: ChangeableTableViewCellDelegate? { get set }
}