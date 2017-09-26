//
//  ViewController.swift
//  Egg Timer
//
//  Created by Gerson Costa on 26/09/17.
//  Copyright © 2017 Gerson Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerValue: UILabel!
    
    var timer = Timer()
    
    var timerCountdown = 210
    
    @objc func processedTimer()  {
        if timerCountdown == 0 {
            timer.invalidate()
        } else {
            timerCountdown = timerCountdown - 1
            timerValue.text = String(timerCountdown)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerValue.text = String(timerCountdown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pauseBtnPressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    
    @IBAction func startBtnPressed(_ sender: UIBarButtonItem) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processedTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func less10BtnPressed(_ sender: UIBarButtonItem) {
        if timerCountdown <= 0 {
            timerCountdown = 0
            timerValue.text = String(timerCountdown)
            timer.invalidate()
        } else {
        timerCountdown = timerCountdown - 10
        timerValue.text = String(timerCountdown)
        }
    }
    
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        timerCountdown = 210
        timerValue.text = String(timerCountdown)
    }
    
    @IBAction func plus10BtnPressed(_ sender: UIBarButtonItem) {
        timerCountdown = timerCountdown + 10
        timerValue.text = String(timerCountdown)
    }
    
    
}

