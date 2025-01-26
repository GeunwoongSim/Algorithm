import Foundation

func solution(_ nums:[Int]) -> Int {
    var sum: Array<Int> = []
    for idx1 in 0..<nums.count-2 {
        for idx2 in (idx1+1)..<nums.count-1 {
            for idx3 in (idx2+1)..<nums.count {
                sum.append(nums[idx1]+nums[idx2]+nums[idx3])
            }
        }
    }
    var answer: Int = 0
    for number in sum {
        var toggle: Bool = true
        for num in 2...Int(sqrt(Double(number))) {
            if number % num == 0 {
                toggle = false
                break
            }
        }
        if toggle { answer += 1 }
    }
    return answer
}
