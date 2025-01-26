import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let reser: Set<Int> = Set(reserve).subtracting(lost)
    let lost : Set<Int> = Set(lost).subtracting(reserve)
    var stu: [Bool] = [Bool](repeating: true, count: n+2)
    lost.forEach{ stu[$0] = false }
    reser.sorted().forEach{
        if !stu[$0] { stu[$0] = true }
        else if !stu[$0-1] { stu[$0-1] = true }
        else if !stu[$0+1] { stu[$0+1] = true }
    }
    return stu[1...n].filter{$0}.count
}

/*
 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다
 ex) 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다
 
 
 */
