//
//  Notifications.swift
//  GreatApp
//
//  Created by iSal on 14/04/20.
//  Copyright © 2020 iSal. All rights reserved.
//

import Foundation
import CloudKit

struct NotificationSchema {
    var icon:String?
    var message:String?
    var title:String?
    var type:NotifType?
    
    init(record:CKRecord) {
        self.message = record.value(forKey: "message") as? String ?? ""
        self.icon = record.value(forKey: "icon") as? String ?? ""
        self.title = record.value(forKey: "title") as? String ?? ""
        self.type = NotifType(rawValue: (record.value(forKey: "type") as? String ?? ""))
    }
    
    enum NotifType:String {
        case tips_n_tricks, message
    }
}
