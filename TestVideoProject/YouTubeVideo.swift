//
//  YouTubeVideo.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import CoreData

class YouTubeVideo: NSManagedObject {
    
    @NSManaged var id: String
    @NSManaged var title: String
    @NSManaged var url: String
    @NSManaged var duration: Int32
    @NSManaged var date: NSDate
}