import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
//    return dic.map { String($0.sorted()) }.contains(spell.sorted().joined()) ? 1 : 2
    
    
    
    for word in dic {
        var num: Int = 0
        for s in spell {
            if word.firstIndex(of: Character(s)) != nil {
                num = num + (word.firstIndex(of: Character(s)) == word.lastIndex(of: Character(s)) ? 1 : 0)
            }
        }
        if num == spell.count { return 1}
    }
    return 2
}

/*
 알파벳이 담긴 배열 spell과 외계어 사전 dic이 매개변수로 주어집니다.
 
 spell에 담긴 알파벳을 한번씩만 모두 사용한 단어가 dic에 존재한다면 1, 존재하지 않는다면 2를 return하도록 solution 함수를 완성해주세요.
 
 ["p", "o", "s"]    ["sod", "eocd", "qixm", "adio", "soo"]   => 2
 ["d", "ecd", "qixm", "adi", "o"]
 ["z", "d", "x"]    ["def", "dww", "dzx", "loveaw"] => 1
 */
