import Foundation

func solution(_ number:[Int]) -> Int {
    var result: Int = 0
    for a in 0..<number.count-2 {
        for b in (a+1)..<number.count-1{
            for c in (b+1)..<number.count{
                if number[a] + number[b] + number[c] == 0 {
                    result += 1
                }
            }
        }
    }
    
    return result
}
