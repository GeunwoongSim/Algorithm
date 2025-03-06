import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
  var s: Int = 0
  var e: Int = 0
  var sum = sequence[s]
  var result: (Int, Int) = (0, sequence.count+1)
  while s < sequence.count && e < sequence.count {
    if sum > k {
      sum -= sequence[s]
      s += 1
    }else {
      if sum == k {
        if result.1 - result.0 > e - s {
          result = (s, e)
        }else if result.1 - result.0 == e - s {
          if result.0 > s { result = (s, e) }
        }
      }
      e += 1
      if e < sequence.count { sum += sequence[e] }
    }
  }
  return [result.0, result.1]
}
