import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var numberX: [Int] = [Int](repeating: 0, count: 10)
    var numberY: [Int] = [Int](repeating: 0, count: 10)
    X.forEach{ numberX[Int(String($0))!] += 1 }
    Y.forEach{ numberY[Int(String($0))!] += 1 }
    
    var numbers: [Int] = zip(numberX,numberY).map{ min($0,$1) }
    if numbers[1...9].reduce(0,+) == 0 && numbers[0] == 0 {
        return "-1"
    }else if numbers[1...9].reduce(0,+) == 0 {
        return "0"
    }
    var result: String = ""
    for idx in (0...9).reversed() {
        result += String(repeating: "\(idx)", count: numbers[idx])
    }
    return result
    
    
    
}
