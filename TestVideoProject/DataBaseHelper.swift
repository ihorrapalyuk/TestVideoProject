//
//  DataBaseHelper.swift
//  TestVideoProject
//
//  Created by Ihor Rapalyuk on 3/13/16.
//  Copyright © 2016 Ihor Rapalyuk. All rights reserved.
//

import MagicalRecord
import CoreData

typealias JSONArray = [NSObject : AnyObject]
class DatabaseHelper<T: NSManagedObject>: NSObject {
    
    private let array: [JSONArray]
    init(array: [JSONArray]) {
        self.array = array
    }
    
    func save() {
        MagicalRecord.saveWithBlockAndWait({ (managedObjectContext) -> Void in
            T.MR_importFromArray(self.array, inContext: managedObjectContext)
        })
    }
    func saveInBackground(complation: (() -> Void)? = nil) {
        MagicalRecord.saveWithBlock({ (managedObjectContext) -> Void in
            T.MR_importFromArray(self.array, inContext: managedObjectContext)
            complation?()
        })
    }
}