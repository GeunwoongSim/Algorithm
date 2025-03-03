import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
  var result: [Int] = [0, 0]
  var stack: [(Int, Int, Int, Int)] = [(0, 0, arr.count, arr.count)]
  while !stack.isEmpty {
    let pos = stack.removeLast()
    var flag: Bool = true
    for y in pos.1..<pos.3 {
      for x in pos.0..<pos.2 {
        if arr[y][x] != arr[pos.1][pos.0] {
          flag = false
          break
        }
      }
      if !flag { break }
    }
    if flag {
      result[arr[pos.1][pos.0]] += 1
    }else {
      stack.append((pos.0, pos.1, (pos.2+pos.0)/2, (pos.3+pos.1)/2))
      stack.append(((pos.2+pos.0)/2, pos.1, pos.2, (pos.3+pos.1)/2))
      stack.append(((pos.2+pos.0)/2, (pos.3+pos.1)/2, pos.2, pos.3))
      stack.append((pos.0, (pos.3+pos.1)/2, (pos.2+pos.0)/2, pos.3))
    }
  }
  return result
}
