import Foundation

func dfs(arrs: [Int], clear: Int, life: Int, dungeons:[[Int]]) -> Int { //arrs: 확인한 던전, life: 남은 피로도, dungeons: 던전 정보 -> 클리어한 던전 수
    var result: Int = clear // 최대로 확인한 던전 수
    var temp: Int = 0
    for idx in 0..<dungeons.count {
        if !arrs.contains(idx) { // 확인 안한 던전 이면 확인
            if life >= dungeons[idx][0] { //최소 피로도 충족
               temp = dfs(arrs: arrs+[idx], clear: clear+1, life: life-dungeons[idx][1], dungeons: dungeons)
            }else { //최소 피로도 충족 못함
               temp = dfs(arrs: arrs+[idx], clear: clear, life: life, dungeons: dungeons)
            }
            if result < temp {
                result = temp
            }
        }
    }
    return result
}
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    return dfs(arrs: [], clear: 0, life: k, dungeons: dungeons)
}
