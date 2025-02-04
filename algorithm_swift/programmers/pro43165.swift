import Foundation

func dfs(index:Int, sum: Int, result: Int, numbers: [Int], target: Int) -> Int{
    if index == numbers.count {
        if sum == target {
            return result+1
        }
        return result
    }
    
    let a = dfs(index: index+1, sum: sum + numbers[index], result: result, numbers: numbers, target: target)
    let b = dfs(index: index+1, sum: sum - numbers[index], result: a, numbers: numbers, target: target)
    return b
}

func bfs(_ numbers:[Int], _ target:Int) -> Int {
    var result: Int = 0
    var queue: [(Int, Int)] = [(0, numbers[0]),(0, -numbers[0])] // $0: index, $1: sum
    var index: Int = 0 // queue에 접근할 변수
    while index < queue.count {
        let element = queue[index]
        index += 1
        let idx = element.0 + 1
        let sum1 = element.1 + numbers[idx]
        let sum2 = element.1 - numbers[idx]
        
        if idx == numbers.count - 1 { // 더이상 enqueue하면 안됨
            if sum1 == target { result += 1 } // 타겟넘버를 만들 수 있음
            if sum2 == target { result += 1 } // 타겟넘버를 만들 수 있음
        }else { // 값을 구해서 새롭게 enqueue
            queue.append((idx, sum1))
            queue.append((idx, sum2))
        }
    }
    return result
}


func solution(_ numbers:[Int], _ target:Int) -> Int {
    return bfs(numbers, target)
//    return dfs(index: 0, sum: 0, result: 0, numbers: numbers, target: target)
}
