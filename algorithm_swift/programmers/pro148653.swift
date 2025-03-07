import Foundation

func solution(_ storey:Int) -> Int {
  let arr = String(storey).reversed().map{ Int(String($0))! }
  let result = min(solve(num: 4, arr: arr),solve(num: 5, arr: arr))
  
  return result
}

func solve(num: Int, arr: [Int]) -> Int {
  var arr = arr
  var result: Int = 0
  var idx = 0
  while idx < arr.count {
    if arr[idx] == 10 {
      if idx == arr.count - 1 {
        arr.append(0)
      }
      arr[idx] = 0
      arr[idx+1] += 1
    }
    if arr[idx] <= num {
      result += arr[idx]
    }else {
      result += (10-arr[idx])
      if idx == arr.count - 1 {
        arr.append(0)
      }
      arr[idx+1] += 1
    }
    idx += 1
  }
  return result
}
