//
//  ViewController.swift
//  aula23
//
//  Created by Yuri Goulart de Oliveira on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startStopButtonOutlet: UIButton!
    
    @IBOutlet weak var SegmentedControlOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var timer = Timer()
    var totalSecond: Int = 1500
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @objc func countdown() {
        var minutes: Int
        var seconds: Int
        
        
        if totalSecond == 1 {
            timer.invalidate()
            startStopButtonOutlet.setTitle("OK", for: .normal)
        }
        totalSecond = totalSecond - 1
        minutes = (totalSecond % 3600) / 60
        seconds = (totalSecond % 3600) % 60
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    @IBAction func startStopButton() {
        if startStopButtonOutlet.titleLabel?.text == "Start" {
            startStopButtonOutlet.setTitle("Stop", for: .normal)
            startTimer()
        } else {
            switch SegmentedControlOutlet.selectedSegmentIndex {
            case 0:
                if startStopButtonOutlet.titleLabel?.text == "OK" {
                    timeLabel.text = "25:00"
                    totalSecond = 1500
                    startStopButtonOutlet.setTitle("Start", for: .normal)
                } else {
                    timer.invalidate()
                    totalSecond = 1500
                    startStopButtonOutlet.setTitle("Start", for: .normal)
                    timeLabel.text = "25:00"
                }
            case 1:
                if startStopButtonOutlet.titleLabel?.text == "OK" {
                    timeLabel.text = "05:00"
                    totalSecond = 300
                    startStopButtonOutlet.setTitle("Start", for: .normal)
                } else {
                    timer.invalidate()
                    totalSecond = 300
                    startStopButtonOutlet.setTitle("Start", for: .normal)
                    timeLabel.text = "05:00"
                }
            default:
                if startStopButtonOutlet.titleLabel?.text == "OK" {
                    timeLabel.text = "15:00"
                    totalSecond = 900
                    startStopButtonOutlet.setTitle("Start", for: .normal)
                } else {
                    timer.invalidate()
                    totalSecond = 900
                    startStopButtonOutlet.setTitle("Start", for: .normal)
                    timeLabel.text = "15:00"
                }
            }
        }
        
    }
    
    @IBAction func segmentedControlActionButton() {
        switch SegmentedControlOutlet.selectedSegmentIndex {
        case 0:
            timeLabel.text = "25:00"
            totalSecond = 1500
            timer.invalidate()
            startStopButtonOutlet.setTitle("Start", for: .normal)
        case 1:
            timeLabel.text = "05:00"
            totalSecond = 300
            timer.invalidate()
            startStopButtonOutlet.setTitle("Start", for: .normal)
        default:
            timeLabel.text = "15:00"
            totalSecond = 900
            timer.invalidate()
            startStopButtonOutlet.setTitle("Start", for: .normal)
        }
    }
}
