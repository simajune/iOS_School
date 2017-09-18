//
//  Student.swift
//  170914_CreditsCalculator
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class Student {
    var name: String
    var studentID: Int
    
    var subjects:[Subject] = []
    var totalGrade: String = "F"
    var totalScore: Int = 0
    var totalGradepoint: Double = 0.0
    
    init(name: String, id: Int) {
        self.name = name
        studentID = id
    }
    
    func setSubjects(subjects: [Subject]) {
        self.subjects = subjects
        
        //        for s in subjects {
        //            totalScore += s.score
        //        }
    }
    
    
    func addSubject(subject: Subject) {
        self.subjects.append(subject)
        //        totalScore += subject.score
    }
}
