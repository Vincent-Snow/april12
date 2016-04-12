//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by mac-admin on 4/12/16.
//  Copyright © 2016 Vints. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNSNotificationObserver()
        setView()
    }
    
    func setView() {
        updateTimerLabel()
        // if timer is running, start button title shoudl
        if TimerController.sharedInstance.timer.isOn {
            startButton.setTitle("Cancel", forState: .Normal)
        } else {
            startButton.setTitle("start nap", forState: .Normal)
        }
    }
    
    func addNSNotificationObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.updateTimerLabel), name: "secondTick", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.presentTimerCompletedAlert), name: "timerCompleted", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startNapButtonTapped(sender: AnyObject) {
        if TimerController.sharedInstance.timer.isOn {
            TimerController.sharedInstance.stopTimer()
        } else {
            TimerController.sharedInstance.startTimer()
        }
        setView()
    }
    
    func updateTimerLabel() {
        timerLabel.text = TimerController.sharedInstance.timeAsString()
    }
    
    func presentTimerCompletedAlert() {
        let alert = UIAlertController(title: "times up!", message: "wake up", preferredStyle: .Alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
        alert.addAction(dismissAction)
        presentViewController(alert, animated: true, completion: nil)
    }
    
}

