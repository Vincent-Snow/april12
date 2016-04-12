//
//  TimerController.swift
//  PowerNapTimer
//
//  Created by mac-admin on 4/12/16.
//  Copyright © 2016 Vints. All rights reserved.
//

import UIKit

class TimerController: NSObject {

    static let sharedInstance = TimerController()
    
    var timer = Timer()
    var localNotification: UILocalNotification?
    
    func startTimer() {
        // check if timer is on. if not set time to 20 minutes and start countdown
        if timer.isOn == false {
            timer.endDate = NSDate(timeIntervalSinceNow: 0.25 * 60)
        secondTick()
        }
    }
    
    func stopTimer() {
        //check if it is on. if it is then remove timers end date and stop countdown
        if timer.isOn {
            timer.endDate = nil
            performSelector(#selector(TimerController.cancelLocalNotification), withObject: self, afterDelay: 0.5)
        }
    }
    
    func secondTick() {
        //check to see fi time reminain is > 0. is so send nsnotification to UI to update label. otherwise stop timer
        if timer.timeRemaining > 0 {
            performSelector(#selector(TimerController.secondTick), withObject: nil, afterDelay: 1)
            NSNotificationCenter.defaultCenter().postNotificationName("secondTick", object: nil)
        } else {
            NSNotificationCenter.defaultCenter().postNotificationName("timerCompleted", object: nil)
            stopTimer()
        }
    }
    
    func scheduleLocalNotification() {
        //create loval notificaton with same fire date as tiemr
        localNotification = UILocalNotification()
        localNotification?.alertBody = "its time to wake up"
        localNotification?.alertTitle = " times up"
        localNotification?.fireDate = timer.endDate
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification ?? UILocalNotification())
    }
    
    func cancelLocalNotification() {
        //cancel the local notification if timer ahs been stopped
        UIApplication.sharedApplication().cancelLocalNotification(localNotification ?? UILocalNotification())
    }
    
    func timeAsString() -> String {
        //return a string represnting the time remaining
        let timeRemaining = Int(timer.timeRemaining)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft * 60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }
}