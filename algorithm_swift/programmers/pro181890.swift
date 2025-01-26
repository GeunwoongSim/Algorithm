import Foundation

func solution(_ str_list:[String]) -> [String] {
    //앞에서부터 직접 찾기
    for idx in 0..<str_list.count {
        if str_list[idx] == "l" { return Array(str_list[0..<idx]) }
        if str_list[idx] == "r" { return Array(str_list[(idx+1)...])}
    }
    return []
    
    
    //firstIndex 활용
    let lIdx: Int = str_list.firstIndex(of: "l") ?? -1
    let rIdx: Int = str_list.firstIndex(of: "r") ?? -1
    
    switch (lIdx,rIdx) {
    case (-1,-1) : return []
    case (_, -1) : return Array(str_list[0..<lIdx])
    case (-1, _) : return Array(str_list[(rIdx+1)...])
    default :
        if lIdx < rIdx { return Array(str_list[0..<lIdx]) }
        else { return Array(str_list[(rIdx+1)...]) }
    }
}


/*
 문자열 리스트 str_list에는 "u", "d", "l", "r" 네 개의 문자열이 여러 개 저장되어 있습니다.
 
 str_list에서 "l"과 "r" 중 먼저 나오는 문자열이 "l"이라면 해당 문자열을 기준으로 왼쪽에 있는 문자열들을 순서대로 담은 리스트를, 먼저 나오는 문자열이 "r"이라면 해당 문자열을 기준으로 오른쪽에 있는 문자열들을 순서대로 담은 리스트를 return하도록 solution 함수를 완성해주세요. "l"이나 "r"이 없다면 빈 리스트를 return합니다.
 
 ["u", "u", "l", "r"] => ["u", "u"]
 */
