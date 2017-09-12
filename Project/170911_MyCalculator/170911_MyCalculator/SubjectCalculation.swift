//
//  SubjectCalculation.swift
//  170911_MyCalculator
//
//  Created by SIMA on 2017. 9. 12..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

class SubjectCalculation {
    func calculation(student: Student) {
        let totalScore: Int = avgSubject(studentName: student)
        if totalScore >= 90 {
            student.totalGrade = "A"
        }else if totalScore >= 80 {
            student.totalGrade = "B"
        }else if totalScore >= 70 {
            student.totalGrade = "C"
        }else if totalScore >= 60 {
            student.totalGrade = "D"
        }
        print("\(student.name)님의 평균 점수는 \(totalScore)이고 최종 학점은 \(student.totalGrade)입니다")
    }
    //student.totalGradePoint =

    func sumAllSubjects(subjects: [Subject]) -> Int {
        var totalScore: Int = 0
        
        for subject in subjects {
            totalScore += subject.score
        }
        return totalScore
    }
    
    func avgSubject(studentName: Student) -> Int {
        let avgScore = sumAllSubjects(subjects: studentName.subjects) / studentName.subjects.count
        return avgScore
    }
    
}
