import Foundation

func solution(_ numbers:[Int]) -> Int {
    return (0...9).reduce(0,+) - numbers.reduce(0,+) // 0~9까지의 합 - numbers의 합 = numbers에 포함 안되는 숫자의 합
    return (0...9).filter{ !numbers.contains($0) }.reduce(0,+)
    
    var number: [Int] = [Int](repeating: 0, count: 10)
    numbers.forEach{ number[$0] += 1 }
    return number.enumerated().filter{$0.element == 0}.map{$0.offset}.reduce(0,+)
}
