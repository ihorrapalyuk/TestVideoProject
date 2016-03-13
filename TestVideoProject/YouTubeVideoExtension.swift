//
//  YouTubeVideoExtension.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import MagicalRecord

extension YouTubeVideo {

    class var allYouTubeVideos: [YouTubeVideo] {
        return (self.MR_findAll() as? [YouTubeVideo]) ?? []
    }
    
    class func recieveWithIdentifier(id: String) -> YouTubeVideo? {
        let predicate = NSPredicate(format: "id == %@", id)
        return self.MR_findFirstWithPredicate(predicate)
    }
    
    class func create(youTubeVideo: YouTubeVideo) {
        let youTubeVideo: JSONArray = ["id": youTubeVideo.id, "title": youTubeVideo.title, "url": youTubeVideo.url, "duration": Int(youTubeVideo.duration), "date": youTubeVideo.date]
        
        DatabaseHelper<YouTubeVideo>(array: [youTubeVideo]).save()
    }
}