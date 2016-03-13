//
//  YouTubeVideo+XCDYouTubeVideo.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import XCDYouTubeKit

extension YouTubeVideo {
    class func createWithXCDYouTubeVideo(newXCDYouTubeVideo: XCDYouTubeVideo) {
        let youTubeVideo: JSONArray = ["id": newXCDYouTubeVideo.identifier, "title": newXCDYouTubeVideo.title, "url": newXCDYouTubeVideo.smallThumbnailURL ?? "", "duration": Int(newXCDYouTubeVideo.duration), "date": newXCDYouTubeVideo.expirationDate ?? NSDate()]
        
        DatabaseHelper<YouTubeVideo>(array: [youTubeVideo]).save()
    }
}