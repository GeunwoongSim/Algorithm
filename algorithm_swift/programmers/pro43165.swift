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

func solution(_ numbers:[Int], _ target:Int) -> Int {
    return dfs(index: 0, sum: 0, result: 0, numbers: numbers, target: target)
}
