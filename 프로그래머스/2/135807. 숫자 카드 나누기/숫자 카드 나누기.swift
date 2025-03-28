import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let arrayA = arrayA.sorted()
    let arrayB = arrayB.sorted()
    var result: Int = 0 // 결과값
    
    // 공약수를 구함
    let aGcdNum = findGCD(arrayA)
    let aGcds = findCDs(aGcdNum).sorted(by: >)
    let aTemp = comp(arrayB, aGcds)
    
    let bGcdNum = findGCD(arrayB)
    let bGcds = findCDs(bGcdNum).sorted(by: >)
    let bTemp = comp(arrayA, bGcds)
    
    result = max(aTemp, bTemp)
    
    return result
}

// 최대 공약수 구하기
// num1 <= num2
func gcd(_ num1: Int, _ num2: Int) -> Int {
    if num2 % num1 == 0 {
        return num1
    }
    return gcd(num2 % num1, num1)
}

// 배열을 받아서 배열의 최대 공약수를 반환
func findGCD(_ array: [Int]) -> Int{
    if array.count == 1 { return array[0] }
    
    var num: Int = gcd(array[0], array[1])
    if array.count >= 3 {
        for idx in 2..<array.count {
            num = gcd(num,array[idx])
        }
    }
    return num
}

// 숫자를 받아서 숫자의 약수 반환
func findCDs(_ num: Int) -> [Int] {
    var cds: Set<Int> = Set<Int>()
    for i in 1...Int(sqrt(Double(num))) {
        if num % i == 0 {
            cds.insert(i)
            cds.insert(num/i)
        }
    }
    return cds.sorted()
}

// 비교할 배열과 공약수를 입력 받아서 조건에 맞는 최대 양의 정수 반환
func comp(_ origin: [Int], _ gcds: [Int]) -> Int {
    var result: Int = 0
    for gcd in gcds {
        var flag = true
        for number in origin {
            if number % gcd == 0 {
                flag = false 
                break
            }
        }
        
        if flag {
            result = max(result, gcd)
        }
    }
    return result
}
