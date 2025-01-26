import Foundation

func solution(_ s:String) -> Int {
    let dics: [String:String] = [
        "zero" : "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4", "five" : "5", "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9"
    ]
    var str: String = s
    for dic in dics {
        str = str.replacingOccurrences(of: dic.key, with: dic.value)
    }
    return Int(str)!
}
