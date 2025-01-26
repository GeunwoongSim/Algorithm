func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let map1: [[Int]] = mapCreate(n, arr1)
    let map2: [[Int]] = mapCreate(n, arr2)
    var answer: [String] = []
    
    for y in 0..<map1.count{
        var str: String = ""
        for x in 0..<map1[y].count{
            if map1[y][x] == 0 && map2[y][x] == 0 {
                str += " "
            }else {
                str += "#"
            }
        }
        answer.append(str)
    }
    return answer
}

func mapCreate(_ n: Int, _ arr: [Int]) -> [[Int]]{
    var map: [[Int]] = []
    for num in arr {
        var str = String(num, radix:2)
        for _ in 0..<n - str.count {
            str.insert("0", at: str.startIndex)
        }
        map.append(str.map{Int(String($0))!})
    }
    
    return map
}
