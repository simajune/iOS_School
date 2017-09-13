//
//  ViewController.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 11..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calculatorValue: UILabel!
    
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
        english.setScore(score: 67)
        let science = Subject(name: "과학")
        science.setScore(score: 88)
        let coding = Subject(name: "코딩")
        coding.setScore(score: 100)
        
        let s1 = Student(name: "정태준", id: 2008271151)
        
        s1.addSubject(subject: math)
        s1.addSubject(subject: english)
        s1.addSubject(subject: science)
        s1.addSubject(subject: coding)
        print(cal.avrgCalculation(student: s1))

        //print(s1.totalScore)
        calculatorValue.text = cal.avrgCalculation(student: s1)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

