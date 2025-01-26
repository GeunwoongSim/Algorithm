import Foundation

func solution(_ n:Int) -> Int {
    let num: String = String(String(n,radix: 3).reversed())
    return Int(num,radix: 3)!
}
