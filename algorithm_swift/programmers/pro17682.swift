func solution(_ dartResult:String) -> Int {
    let score: [Int] = dartResult.components(separatedBy: ["S","D","T","*","#"]).filter{!$0.isEmpty}.map{Int($0)!}
    let bonus = dartResult.components(separatedBy: ["0","1","2","3","4","5","6","7","8","9","*","#"]).filter{!$0.isEmpty}.map{String($0)}
    let options = dartResult.components(separatedBy: ["S","D","T"]).enumerated().filter{$0.offset>=1 && $0.offset<=3}
    
    let option: [String] = options.map{
        let pr: String = String($0.element.prefix(1))
        return (pr != "#" && pr != "*") ? "" : pr
    }
    var result: [Int] = []
    for idx in 0..<score.count {
        var num = score[idx]
        if bonus[idx] == "D" { num = num * num }
        else if bonus[idx] == "T" { num = num * num * num }
        
        if option[idx] == "#" { num *= -1 }
        else if option[idx] == "*" {
            num *= 2
            if !result.isEmpty { result.append(result.removeLast()*2) }
        }
        result.append(num)
    }
    return result.reduce(0,+)
    
    
    
    
//    let dartResult = Array(dartResult).map{ String($0) }
//    print(dartResult)
//    //input, 최종적으로 라운드별 점수 = score^bonus * option
//    var score: [Int] = [] // 라운드별 스코어
//    
//    var idx: Int = 0
//    while idx < dartResult.count {
////        print(idx, dartResult[idx])
//        if dartResult[idx] >= "0" && dartResult[idx] <= "9" {
//            if dartResult[idx+1] != "0" { //한자리 수
//                score.append(Int(dartResult[idx])!)
//            }else { //10인 경우
//                score.append(10)
//                idx += 1
//            }
//        }else if dartResult[idx] == "S" || dartResult[idx] == "D" || dartResult[idx] == "T" {
//            var num = score.removeLast()
//            if dartResult[idx] == "D" { num = num * num }
//            if dartResult[idx] == "T" { num = num * num * num }
//            score.append(num)
//        }else if dartResult[idx] == "*"{
//            if score.count == 1 {
//                score.append(score.removeLast() * 2)
//            }else if score.count >= 2 {
//                let num = score.removeLast() * 2
//                score.append(score.removeLast() * 2)
//                score.append(num)
//            }
//        }else if dartResult[idx] == "#"{
//            score.append(score.removeLast() * -1)
//        }
//        idx += 1
//    }
//    print(score)
//    return score.reduce(0,+)
}
