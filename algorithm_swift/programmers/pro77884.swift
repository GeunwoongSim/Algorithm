import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result: Int = 0
    for num in left...right {
        if soo(num) % 2 == 0 {
            result += num
        } else {
            result -= num
        }
    }
    return result
}

func soo(_ number: Int) -> Int {
    var result: Int = 0
    
    for num in 1...number{
        if number % num == 0 {
            result += 1
        }
    }
    return result
}
