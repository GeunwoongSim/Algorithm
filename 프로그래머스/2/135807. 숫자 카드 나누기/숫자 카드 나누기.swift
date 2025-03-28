import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let arrayA = arrayA.sorted()
    let arrayB = arrayB.sorted()
    var result: Int = 0 // 결과값
    
    print(arrayA, arrayB)
    // 공약수를 구함
    let aCD = findCD(arrayA)
    print(aCD)
    
    
    return result
}

func gcd(_ num1: Int, _ num2: Int) -> Int {
    let minNum = min(num1, num2)
    let maxNum = max(num1, num2)
    return maxNum % minNum == 0 ? maxNum/minNum : gcd(minNum, maxNum%minNum)
}

func findCD(_ arr: [Int]) -> [Int] {
    // 원소가 한개면 해당 원소 반환
    if arr.count == 1 { return arr } 
    
    // 공약수들
    var result: [Int] = []
    // 최소값이랑 최대값이랑 최대 공약수를 구함 - 범위 줄이기
    let len = arr.count
    var num = gcd(arr[0], arr[len-1]) 
    
    var idx: Int = 1
    while idx < arr.count - 1 {
        num = gcd(num, arr[idx])
        idx += 1
    }
    
    let sqrtNum = sqrt(Double(num))
    
    for value in 1...Int(sqrtNum) {
        if num % value == 0 {
            result.append(value)
            result.append(num/value)
        }
    }
    
    return result
}
