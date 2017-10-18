//
//  ViewController.swift
//  171017_Xylophone
//
//  Created by SIMA on 2017. 10. 17..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var player: AVAudioPlayer!
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    var selectSoundNum: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        selectSoundNum = soundArray[sender.tag - 1]
        
        playSound()
        
//        //AudioToolBox
//        if let soundURL = Bundle.main.url(forResource: "note" + "\(sender.tag)", withExtension: "wav") {
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            AudioServicesPlaySystemSound(mySound)
//        }
        
        
        
    }
    
    func playSound() {
        //AVFoundation
        let url = Bundle.main.url(forResource: selectSoundNum, withExtension: "wav")
        do{
            player = try AVAudioPlayer(contentsOf: url!)
        }catch{
            print(error)
        }
        player.play()
    }
    
}

