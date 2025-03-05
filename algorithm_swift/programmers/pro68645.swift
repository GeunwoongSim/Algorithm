import Foundation

func solution(_ n:Int) -> [Int] {
  var idx = 0
  var num = 1
  var arr = [Int](repeating: -1, count: (1...n).reduce(0, +))
  var preIdx = 0
  
  for c in 0..<(n-1)/3+1 {
    idx = preIdx+c*4
    preIdx = idx
    arr[idx] = num
    num += 1
    for z in 1..<(n-3*c) {
      idx += 2*c+z
      arr[idx] = num
      num += 1
    }
    for _ in 0..<n-(3*c)-1 {
      idx += 1
      arr[idx] = num
      num += 1
    }
    if (n-2)-3*c > 0 {
      for z in 0..<(n-2)-3*c {
        idx -= ((n-c)-z)
        arr[idx] = num
        num += 1
      }
    }
  }
  return arr
}
