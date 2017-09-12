//
//  Subject.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Subject {
    var name: String
    var score: Int = 0
    var gradePoint: Double = 0
    var grade: String = "F"
    var credits: Int = 1
    
    
    init(name: String){
        self.name = name
        //self.score = score
    }
    
    func setScore(score: Int) {
        self.score = score
    }
}





