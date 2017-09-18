//
//  main.swift
//  170914_CreditsCalculator
//
//  Created by SIMA on 2017. 9. 18..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

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

