//
//  SubjectCalculation.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class SubjectCalculation {
    func avrgCalculation(student: Student) -> String {
        let avgScore: Double = avgSubject(studentName: student)
        var text: String = ""
        if avgScore >= 90 {
            student.totalGrade = "A"
        }else if avgScore >= 80 {
            student.totalGrade = "B"
        }else if avgScore >= 70 {
            student.totalGrade = "C"
        }else if avgScore >= 60 {
            student.totalGrade = "D"
        }
        text = "\(student.name)님의 평균점수는 \(avgScore)이고 최종학점은 \(student.totalGrade)입니다"
        //print("\(student.name)님의 평균점수는 \(avgScore)이고 최종학점은 \(student.totalGrade)입니다")
        return text
        
    }
    //student.totalGradePoint =

    func sumAllSubjects(subjects: [Subject]) -> Int {
        var totalScore: Int = 0
        
        for subject in subjects {
            totalScore += subject.score
        }
        return totalScore
    }
    
    func avgSubject(studentName: Student) -> Double {
        let avgScore = Double(sumAllSubjects(subjects: studentName.subjects)) / Double(studentName.subjects.count)
        return avgScore
    }
    
}
