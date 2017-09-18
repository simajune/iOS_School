# 학점 계산기

1. 학생을 등록하고 그 학생이 수강한 과목을 등록하고 그 과목의 점수를 입력해서 점수의 평균을 구하고 그 값에 대한 학점을 구해야한다.

** **

—main.swift

```swift
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
```

—Subject.swift

```swift
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
```

— Student.swift

```swift
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
```

—SubjectCalculation.swift

```swift
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
        return text
        
    }

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
```

