import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var dic: [String:Bool] = [:]
    var last = words[0].first!
    for (i,word) in words.enumerated() {
        if last != word.first { return [i%n+1,i/n+1] } // 끝말잇기 실패
        last = word.last!
        guard let _ = dic[word] else{ // guard문이 작동하면 딕셔너리값이 nil이므로 사용한적 없는 단어
            dic[word] = true
            continue
        }
        return [i%n+1,i/n+1] // 이전에 사용한 단어 사용
    }
    return [0,0]
}


/*
 딕셔너리의 Key는 Hashable이므로 빠르게 접근이 가능할거라 판단하여 딕셔너리를 사용
 contain을 사용해서 배열의 값을 확인하는 과정을 사용시 시간이 오래 걸릴거라 생각
 */
