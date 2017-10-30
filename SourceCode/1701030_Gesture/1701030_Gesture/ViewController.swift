//
//  ViewController.swift
//  1701030_Gesture
//
//  Created by SIMA on 2017. 10. 30..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var coordinates: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapGesture(_ sender: Any) {
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //터치된 포인트가 inView위치에 어느 좌표에 해당되는지 표시
        print("xposition", touch.location(in: touch.view).x)
        coordinates.text = "좌표: (\(touch.location(in: touch.view).x), \(touch.location(in: touch.view).y))"
        //터치가 일어난 시간 반환
        print("touch timeStamp", touch.timestamp)
        
        //연속적으로 일어난 터치의 횟수
        print("touch tapCount", touch.tapCount)
        counter.text = "횟수: \(touch.tapCount)"
        return true
    }
    
    
}

