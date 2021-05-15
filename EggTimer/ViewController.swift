//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var eggTimer : [String:Int] = ["Soft":5,"Medium":7,"Hard":12]
    var timer = Timer()
    var audioPlayer : AVAudioPlayer?
    @IBOutlet weak var eggProgress: UIProgressView!
    @IBOutlet weak var eggLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        eggProgress.progress = 0.0
        timer.invalidate()
        self.eggLabel.text = sender.currentTitle!
        let hardness = sender.currentTitle!
        var secondsRemaining = eggTimer[hardness]!
        let x = 1/Float(eggTimer[hardness]!)
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        timer = Timer.scheduledTimer(withTimeInterval: 1.0,repeats: true){
            (Timer) in
        if secondsRemaining > 0{
                secondsRemaining -= 1
        }
        else{
                Timer.invalidate()
                self.eggLabel.text = "DONE!"
                self.audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                self.audioPlayer?.play()            
        }
        self.eggProgress.progress += x
        }
    }
}
