//
//  MainViewController.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import UIKit
import XCDYouTubeKit
import SDWebImage

class MainTableViewController: UITableViewController, ChangeableTableViewCellDelegate {
    
    private let mainTableViewCellIdentifier = "MainTableViewCellIdentifier"
    
    private var youTubeVideoIdentifiers: [Int: [String]] = [0: ["JDbEgOsWGG4", "DO_3ECSL0rc", "48kekFLZkXU", "AZxK_6OQV7c", "mlzu_DXtG80", "nVu0naGTS_I", "ewSBggmhfrE", "MkPQEXK5lRE"], 1: ["ewSBggmhfrE", "MkPQEXK5lRE", "kHU8sdqxmKA", "YGIyaim_5kw", "7xUSH1QLHzk", "VkvpwEAriu4", "wzl_195ceFc"]]
    
    //MARK: UITableViewDataSource method
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.youTubeVideoIdentifiers.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.youTubeVideoIdentifiers[section]?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(self.mainTableViewCellIdentifier,
            forIndexPath: indexPath) as? MainTableViewCell, youTubeVideo = self.youTubeVideoIdentifiers[indexPath.section]?[indexPath.row] else {
                assertionFailure("Wrong UITableViewCell")
                return UITableViewCell()
        }
        self.configureMainTableViewCell(cell, withYouTubeVideoIdentifier: youTubeVideo)
        return cell
    }
    
    private func configureMainTableViewCell(cell: MainTableViewCell, withYouTubeVideoIdentifier youTubeVideoIdentifier: String) {
        cell.changeableTableViewCellDelegate = self
        
        guard let youTubeVideo = YouTubeVideo.recieveWithIdentifier(youTubeVideoIdentifier) else {
            XCDYouTubeClient.defaultClient().getVideoWithIdentifier(youTubeVideoIdentifier) { (youTubeVideo, error) -> Void in
                guard let youTubeVideo = youTubeVideo else {
                    return
                }
                YouTubeVideo.createWithXCDYouTubeVideo(youTubeVideo)
                let youTubeVideoViewModel = YouTubeVideoViewModel(youTubeVideo: youTubeVideo)
                self.configureMainTableViewCell(cell, withYouTubeVideoViewModel: youTubeVideoViewModel)
            }
            return
        }
        let youTubeVideoViewModel = YouTubeVideoViewModel(youTubeVideo: youTubeVideo)
        self.configureMainTableViewCell(cell, withYouTubeVideoViewModel: youTubeVideoViewModel)
    }
    
    private func configureMainTableViewCell(cell: MainTableViewCell, withYouTubeVideoViewModel youTubeVideoViewModel: YouTubeVideoViewModel) {
        cell.titleLabel?.text = youTubeVideoViewModel.title
        cell.durationLabel?.text = youTubeVideoViewModel.duration
        cell.dateLabel?.text = youTubeVideoViewModel.dateString
        cell.previewButton?.sd_setBackgroundImageWithURL(youTubeVideoViewModel.url, forState: .Normal)
        cell.changeableTableViewCellDelegate = self
    }
    
    //MARK: ChangeableTableViewCellDelegate
    
    func changeableTableViewCellDidChange(cell: UITableViewCell) {
        guard let _ = cell as? MainTableViewCell,
            indexPath = self.tableView.indexPathForCell(cell),
            youTubeVideo = self.youTubeVideoIdentifiers[indexPath.section]?[indexPath.row] else {
                return
        }
        let videoPlayerViewController = XCDYouTubeVideoPlayerViewController(videoIdentifier: youTubeVideo)
        self.presentViewController(videoPlayerViewController, animated: true, completion: nil)
    }
}
