import Foundation

func solution(_ babbling:[String]) -> Int {
    let arrs: [String] = ["aya", "ye", "woo", "ma"]
    let inputs: [String] = babbling.filter{ //연속해서 사용한 경우 제외
        var toggle: Bool = true
        for arr in ["ayaaya", "yeye", "woowoo", "mama"] {
            if $0.contains(arr) { toggle = false }
        }
        return toggle
    }
    var result: Int = 0
    for str in inputs {
        var str: String = str
        for arr in arrs {
            str = str.replacingOccurrences(of: arr, with: " ")
        }
        str = str.replacingOccurrences(of: " ", with: "")
        if str.isEmpty {
            result += 1
        }
    }
    return result
}
