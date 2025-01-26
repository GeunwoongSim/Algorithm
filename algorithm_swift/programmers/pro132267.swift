import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var n: Int = n
    var result: Int = 0
    while n >= a {
        result += (n / a) * b
        n = n%a + n/a*b
    }
    return result
}
