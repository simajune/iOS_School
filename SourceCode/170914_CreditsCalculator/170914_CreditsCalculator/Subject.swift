//
//  Subject.swift
//  170914_CreditsCalculator
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Subject {
    var name: String
    var score: Int = 0
    var gradePoint: Double = 0
    var grade: String = "F"
    var credits: Int = 1
    
    init (name: String) {
        self.name = name
    }
    
    func setScore (score: Int) {
        self.score = score
    }
    
    func changeGrade() {
        if score > 0 && score <= 100 {
            if score >= 95 {
                grade = "A+"
            }else if score >= 90 {
                grade = "A"
            }else if score >= 85 {
                grade = "B+"
            }else if score >= 80 {
                grade = "B"
            }else if score >= 75 {
                grade = "C+"
            }else if score >= 70 {
                grade = "C"
            }else if score >= 65 {
                grade = "D+"
            }else if score >= 60 {
                grade = "D"
            }
        }
    }
}
