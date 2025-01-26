import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    var result: Int = 0
    var str = myString
    while str.count >= pat.count{
        if str.hasSuffix(pat){
            result += 1
        }
        str.removeLast()
    }
    return result
}
