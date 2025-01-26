import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dics: [String:[String]] = [:]
    
    for clothe in clothes { //종류별 정리
        if dics[clothe[1]] == nil {
            dics[clothe[1]] = []
        }
        dics[clothe[1]]!.append(clothe[0])
    }
    var result: Int = 1
    for dic in dics {
        result *= (dic.value.count+1)
    }
    return result-1
}
