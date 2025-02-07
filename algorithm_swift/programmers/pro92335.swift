import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    //진수 변경
    var result: Int = 0 // 조건에 부합하는 P의 개수
    let num: [String] = String(n, radix: k).map{ String($0) }
    var idx: Int = 0
    var numberStr: String = ""
    var strToInt: Int = 0
    while idx < num.count {
        if num[idx] == "0" { // 0 을 만난경우 여기서 부터 새로운 P0찾기
            strToInt = Int(numberStr) ?? 0
            if checkPrime(strToInt) { result += 1 }
            numberStr = ""
        }
        numberStr += num[idx]
        idx += 1
    }
    if numberStr != "" {
        strToInt = Int(numberStr) ?? 0
        if checkPrime(strToInt) { result += 1 }
    }
    return result
}
func checkPrime(_ number: Int) -> Bool { // 소수 판별
    if number == 0 || number == 1 { return false }
    if number == 2 || number == 3 { return true}
    // 4부터 정상작동
    let num: Double = Double(number)
    for i in 2...Int(sqrt(num)) {
        if number % i == 0 { return false}
    }
    return true
}
