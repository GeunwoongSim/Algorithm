import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var dic: [String.Element : Int] = [:] // 알파벳 : 최소 횟수
    for str in keymap {
        for cha in str.enumerated() {
            if dic[cha.element] == nil {
                dic[cha.element] = cha.offset + 1
            } else { 
                dic[cha.element] = min(dic[cha.element]!,cha.offset+1)
            }
        }
    }
    var result: [Int] = []
    for target in targets {
        var sum: Int = 0
        for cha in target {
            if dic[cha] == nil {
                sum = -1
                break
            }else {
                sum += dic[cha]!
            }
        }
        result.append(sum)
    }
    
    return result
}
