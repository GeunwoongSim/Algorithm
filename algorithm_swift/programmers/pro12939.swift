func solution(_ s:String) -> String {
    let numbers: [Int] = s.components(separatedBy: " ").map{ Int($0)! }.sorted()
    return "\(numbers.first!) \(numbers.last!)"
}
