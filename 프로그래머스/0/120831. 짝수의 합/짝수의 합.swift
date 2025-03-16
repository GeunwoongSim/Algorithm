import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    for n in 1...n{
        if n%2 == 0 {
            result = result + n
        }
    }
    
    return result
}