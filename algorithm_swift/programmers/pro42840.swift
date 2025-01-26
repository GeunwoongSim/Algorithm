import Foundation

func solution(_ answers:[Int]) -> [Int] {
//    let h1: [Int] = [1,2,3,4,5] //5개
//    let h2: [Int] = [2,1,2,3,2,4,2,5] //8개
//    let h3: [Int] = [3,3,1,1,2,2,4,4,5,5] //10개
//    var correct: [Int] = [0,0,0]
//    
//    for answer in answers.enumerated() {
//        let h1Idx: Int = answer.offset % h1.count
//        let h2Idx: Int = answer.offset % h2.count
//        let h3Idx: Int = answer.offset % h3.count
//        if h1[h1Idx] == answer.element { correct[0] += 1 }
//        if h2[h2Idx] == answer.element { correct[1] += 1 }
//        if h3[h3Idx] == answer.element { correct[2] += 1 }
//    }
//    let max: Int = correct.max()!
//    return correct.enumerated().filter{$0.element == max}.map{$0.offset+1}
    
    //깔끔히 정리
    let h: [[Int]] = [[1,2,3,4,5],[2,1,2,3,2,4,2,5],[3,3,1,1,2,2,4,4,5,5]] // 5,8,10개 반복
    var correct: [Int] = [0,0,0]
    
    for (i,a) in answers.enumerated() {
        if h[0][i%5] == a { correct[0] += 1 }
        if h[1][i%8] == a { correct[1] += 1 }
        if h[2][i%10] == a { correct[2] += 1 }
    }
    let max: Int = correct.max()!
    return correct.enumerated().filter{ $0.element == max }.map{ $0.offset+1 }
}
