import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result: String = ""
    let cans: [(String,String)] = [("R","T"), ("C","F"), ("J","M"), ("A","N")]
    var dic: [String:Int] = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    
    for value in zip(survey, choices) {
        if value.1 <= 3 { dic[String(value.0.prefix(1))]! += abs(4 - value.1) }
        else { dic[String(value.0.suffix(1))]! += abs(4 - value.1) }
    }
    for can in cans {
        if dic[can.0]! < dic[can.1]! { result += can.1 }
        else { result += can.0 }
    }
    return result
}
