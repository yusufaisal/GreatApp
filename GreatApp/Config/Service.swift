//
//  Service.swift
//  GreatApp
//
//  Created by iSal on 14/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import Foundation
import CloudKit


class CKService {
    static let shared: CKService = {
        return CKService()
    }()
    
    var recordID:CKRecord.ID?
    private var defaultContainer = CKContainer.default() {
        didSet {
            self.defaultContainer.fetchUserRecordID { (recordID, error) -> Void in
                if let responseError = error {
                    self.errorHandler(error: responseError)
                } else if let userRecordID = recordID {
                    self.recordID = userRecordID
                }
            }
        }
    }
    
    func getNotification(complete: @escaping (_ instance: [NotificationSchema]?, _ error: NSError?) -> ()){
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: "NotificationSchema", predicate: pred)
        query.sortDescriptors = [sort]
        defaultContainer.publicCloudDatabase.perform(query, inZoneWith: nil) {[self] results, error in
            if let error = error {
                self.errorHandler(error: error)
                complete(nil,error as NSError)
            } else if let checkedResults = results {
                let posts = self.parseNotificaitonResults(records: checkedResults)
                complete(posts,nil)
            }
        }
    }
    
    private func parseNotificaitonResults(records: [CKRecord]) -> [NotificationSchema]{
        var notifs = [NotificationSchema]()
        
        records.forEach { (record) in
            notifs.append(NotificationSchema(record:record))
        }
        return notifs
    }
    
    private func errorHandler(error: Error) {
        print("CloudKit Message :: ",error.localizedDescription)
    }
}
