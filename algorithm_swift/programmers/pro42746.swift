import Foundation

func solution(_ numbers:[Int]) -> String {
    let numbers: [String] = numbers.map{ String($0) }.sorted{ $0+$1 > $1+$0 }
    if numbers[0] == "0" { return "0" }
    return numbers.reduce(into: ""){ $0 += $1 }
}
