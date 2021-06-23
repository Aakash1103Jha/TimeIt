//
//  ViewController.swift
//  TimeIt
//
//  Created by Aakash Jha on 23/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayTimeLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var time = Timer()
    var counter = 0.00
    var isTimerOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // when time is not counting
        displayTimeLabel.text = "0.00"
        stopButton.isEnabled = false // disable stop button
        pauseButton.isEnabled = false // disable pause button
    }
    
    @objc func startCounter() {
        counter += 0.01
        displayTimeLabel.text = String(format: "%.2f", counter)
    }

    // start timer
    @IBAction func startButtonPressed(_ sender: UIButton) {
        if isTimerOn {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        stopButton.isEnabled = true
        
        time = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
    }
    
    // pause timer
    @IBAction func pausebuttonPresseed(_ sender: UIButton) {
        stopButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        time.invalidate()
        isTimerOn = false

    }
    
    // stop and reset timer
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        stopButton.isEnabled = false
        time.invalidate()
        isTimerOn = false
        counter = 0.00
        displayTimeLabel.text = String(counter)

    }
    
    

    
}


