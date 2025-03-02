import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
  var result: [Int64] = []
  for number in numbers {
    if number == 0 {
      result.append(1)
      continue
    }
    let log2N = Int64(log2(Double(number)))
    if Int64(pow(2.0, Double(log2N+1)))-1 == number { // 2^n - 1인 경우
      let n = Int64(log2(Double(number))) + 1
      let temp = Int64(pow(2.0,Double(n+1)) - 1 - pow(2.0,Double(n-1)))
      result.append(temp)
    } else {
      var tempArr: [String] = String(number, radix: 2).map { String($0) }
      var idx: Int = 0
      for i in (0..<tempArr.count).reversed() {
        if tempArr[i] == "0" {
          idx = i + 1
          tempArr[i] = "1"
          break
        }
      }
      for i in idx..<tempArr.count {
        if tempArr[i] == "1" {
          tempArr[i] = "0"
          break
        }
      }
      let int64N: Int64 = Int64(tempArr.joined(), radix: 2)!
      result.append(int64N)
    }
  }
  return result
}
