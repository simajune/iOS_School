//
//  ViewController.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let lb: UILabel = UILabel(frame:CGRect(x: 100, y: 50, width: 500, height: 30))
//        lb.text = "코드로 UI만들기"
//        self.view.addSubview(lb)
        let cal = SubjectCalculation()
        
        let math = Subject(name: "수학")
        math.setScore(score: 100)
        let english = Subject(name: "영어")
        english.setScore(score: 80)
        
        
        let s1 = Student(name: "정태준", id: 2008271151)
        
        s1.addSubject(subject: math)
        s1.addSubject(subject: english)
        cal.calculation(student: s1)
        //print(s1.totalScore)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

