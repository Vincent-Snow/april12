//
//  Timer.swift
//  PowerNapTimer
//
//  Created by mac-admin on 4/12/16.
//  Copyright © 2016 Vints. All rights reserved.
//

import Foundation

class Timer {
    
    var endDate: NSDate?
    var timeRemaining: NSTimeInterval {
        if let endDate = endDate {
            return endDate.timeIntervalSinceDate(NSDate())
        } else {
            return 20 * 60
        }
    }
    
    var isOn: Bool {
        if endDate == nil {
            return false
        } else {
            return true
        }
    }
    
}