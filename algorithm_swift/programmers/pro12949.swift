import Foundation

func printArray(_ arr: [[Int]]){
    for y in arr{
        for x in y{
            print(x,terminator: " ")
        }
        print()
    }
}

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: arr2[0].count), count: arr1.count)
    
    for ay in 0..<arr1.count{
        for bx in 0..<arr2[0].count{
            var num = 0
            for ax in 0..<arr1[0].count{
                num += arr1[ay][ax] * arr2[ax][bx]
            }
            result[ay][bx] = num
        }
    }
    return result
}
