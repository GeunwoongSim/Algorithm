import Foundation

// word = 현재 단어, target = 찾을 단어, num = 단어를 찾았을때 반환할 위치, exe = 단어 위치를 찾는 수(찾기전까지만 제대로 작동하면됨)
func dfs(_ word: [String], _ target: [String], _ tuple: (num: Int, exe: Int)) -> (Int, Int) {
    var result: (Int, Int) = tuple
    if result.0 != -1 { return result } // 결과값이 이미 나왔으면 반환
    // 찾고자 하는 값이 같은지
    if check(word, target) { result.0 = result.1 } //현재까지 횟수를 넣음
    if word.count < 5 {
        result = dfs(word+["A"], target, (result.0,result.1+1))
        result = dfs(word+["E"], target, (result.0,result.1+1))
        result = dfs(word+["I"], target, (result.0,result.1+1))
        result = dfs(word+["O"], target, (result.0,result.1+1))
        result = dfs(word+["U"], target, (result.0,result.1+1))
    }
    return result
}
func solution(_ word:String) -> Int {
    return bfs(word)
//    let target: [String] = word.map{ String($0) }
    //    return dfs([], target, (-1,0)).0
}
func check(_ w1: [String], _ w2: [String]) -> Bool {
    if w1.count != w2.count { return false }
    for value in zip(w1, w2) {
        if value.0 != value.1 { return false }
    }
    return true
}

func bfs(_ target: String) -> Int {
    var queue: [String] = ["A","E","I","O","U"]
    var idx: Int = 0
    
    while queue.last != "UUUUU" {
        let str = queue[idx]
        queue.append(str+"A")
        queue.append(str+"E")
        queue.append(str+"I")
        queue.append(str+"O")
        queue.append(str+"U")
        idx += 1
    }
    queue.sort(by: <)
    for (i,str) in queue.enumerated() {
        if str == target {
            return i+1
        }
    }
    return -1
}
