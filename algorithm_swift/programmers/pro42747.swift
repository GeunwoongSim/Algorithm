import Foundation

func solution(_ citations:[Int]) -> Int {
    var hIdx: Int = 0
    let citations: [Int] = citations.sorted()
    
    for num in citations.enumerated() {
        if num.element >= citations.count-num.offset {
            hIdx = citations.count-num.offset
            break
        }
    }
    return hIdx
}
