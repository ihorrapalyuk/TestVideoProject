//
//  YouTubeVideoViewModel.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import XCDYouTubeKit

class YouTubeVideoViewModel {
    
    let id: String
    let title: String
    let url: NSURL?
    let duration: String
    let dateString: String
    
    private static let dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        return dateFormatter
    }()
    
    init(youTubeVideo: YouTubeVideo) {
        self.id = youTubeVideo.id
        self.title = youTubeVideo.title
        self.url = NSURL(string: youTubeVideo.url)
        self.duration = String.stringFromTimeInterval(youTubeVideo.duration)
        self.dateString = YouTubeVideoViewModel.dateFormatter.stringFromDate(youTubeVideo.date)
    }
    
    init(youTubeVideo: XCDYouTubeVideo) {
        self.id = youTubeVideo.identifier
        self.title = youTubeVideo.title
        self.url = youTubeVideo.smallThumbnailURL
        self.duration = String.stringFromTimeInterval(Int32(youTubeVideo.duration))
        self.dateString = YouTubeVideoViewModel.dateFormatter.stringFromDate(youTubeVideo.expirationDate ?? NSDate())
    }
}