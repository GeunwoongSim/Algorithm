import Foundation

func solution(_ food:[Int]) -> String {
    var result: String = ""
    for idx in 1..<food.count {
        result += String(repeating: String(idx), count: food[idx]/2)
    }
    return result + "0" + result.reversed()
}
