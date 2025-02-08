import Foundation

func solution(_ land:[[Int]]) -> Int{
    let len: Int = land.count
    var arr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 4), count: len+1)
    for (idx,nums) in land.enumerated() {
        arr[idx+1][0] = max(max(arr[idx][1],arr[idx][2]),arr[idx][3]) + nums[0]
        arr[idx+1][1] = max(max(arr[idx][0],arr[idx][2]),arr[idx][3]) + nums[1]
        arr[idx+1][2] = max(max(arr[idx][0],arr[idx][1]),arr[idx][3]) + nums[2]
        arr[idx+1][3] = max(max(arr[idx][0],arr[idx][1]),arr[idx][2]) + nums[3]
    }
    return max(max(max(arr[len][0],arr[len][1]),arr[len][2]),arr[len][3])
}
