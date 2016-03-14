//
//  ChangableTableViewCell.swift
//  OnGo
//
//  Created by Ihor Rapalyuk on 12/29/15.
//  Copyright © 2015 Lezgro. All rights reserved.
//

import Foundation

protocol ChangeableTableViewCell {
    
    var changeableTableViewCellDelegate: ChangeableTableViewCellDelegate? { get set }
}