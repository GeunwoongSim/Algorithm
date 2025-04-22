import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    var result: Int = 0 // 결과값
    
    // lifes[idx][pick] = idx번째 pick 곡괭이를 썼을때의 피로도
    // (pick: 0~2) - 0: 다이아, 1: 철, 2: 돌
    /*
        1번 예시
        3다이아, 2철 : [0][0] = 5, [0][1] = 17, [0][2] = 80
        1다이아, 1철, 1돌 : [1][0] = 3, [1][1] = 7, [1][2] = 31,
    */
    var lifes: [[Int]] = [] 
    
    for (idx, mineral) in minerals.enumerated() {
        if lifes.count < (idx/5+1) { lifes.append([0, 0, 0]) }
        
        if mineral == "diamond" {
            lifes[idx/5][0] += 1
            lifes[idx/5][1] += 5
            lifes[idx/5][2] += 25
        } else if mineral == "iron" {
            lifes[idx/5][0] += 1
            lifes[idx/5][1] += 1
            lifes[idx/5][2] += 5
        } else {
            lifes[idx/5][0] += 1
            lifes[idx/5][1] += 1
            lifes[idx/5][2] += 1
        }
    }
    // print(lifes)
    // 사용할 곡괭이 선별
    var usePicks: [Int] = [0, 0, 0]
    if picks.reduce(0, +) <= lifes.count { // 곡괭이가 모자란 경우 - 전부 사용
        usePicks = picks
    } else { // 곡괭이가 남는 경우 - 일부만 사용
        var pickNum = 0 // 현재까지 선별한 곡괭이 개수
        for (idx, pick) in picks.enumerated() {
            
            if pick < lifes.count - pickNum { // 해당 곡괭이를 전부 골라도 개수를 넘지 않음
                pickNum += pick
                usePicks[idx] = pick
            } else { // 해당 곡괭이 중 일부만 골라야함
                usePicks[idx] = lifes.count - pickNum
                pickNum += lifes.count - pickNum // 모자란 개수만 선택
            }
            // print("idx: \(idx), lifes: \(lifes.count), pickNum: \(pickNum), pick: \(pick)")
        }
    }
    // print(usePicks)
    
    var sortedLifes: [[Int]] = []
    for i in 0..<usePicks.reduce(0, +) {
        sortedLifes.append(lifes[i])
    }
    sortedLifes = sortedLifes.sorted {
        return $0[2] > $1[2]
    }
    // print(sortedLifes)
    
    var idx: Int = 0
    for i in idx..<idx+usePicks[0] {
        result += sortedLifes[i][0]
    }
    idx += usePicks[0]
    for i in idx..<idx+usePicks[1] {
        result += sortedLifes[i][1]
    }
    idx += usePicks[1]
    for i in idx..<idx+usePicks[2] {
        result += sortedLifes[i][2]
    }
    
    return result
}