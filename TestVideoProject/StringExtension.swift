//
//  StringExtension.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import Foundation

extension String {
    static func stringFromTimeInterval(interval: NSTimeInterval) -> String {
        let interval = Int32(interval)
        return stringFromTimeInterval(interval)
    }
    
    static func stringFromTimeInterval(interval: Int32) -> String {
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}