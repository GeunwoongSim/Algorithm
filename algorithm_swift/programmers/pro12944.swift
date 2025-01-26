func solution(_ arr:[Int]) -> Double {
    let sum: Double = Double(arr.reduce(0,+))
    return sum / Double(arr.count)
}
