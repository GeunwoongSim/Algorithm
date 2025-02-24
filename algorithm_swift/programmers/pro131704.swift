import Foundation

func solution(_ order:[Int]) -> Int {
  var subContainer: [Int] = []
  var result: Int = 0
  var now: Int = 1
  var idx: Int = 0
  
  
  while idx < order.count {
    if order[idx] == now {
      result += 1
      now += 1
      idx += 1
    }
    else if order[idx] > now {
      subContainer.append(now)
      now += 1
    }
    else {
      if subContainer.last == order[idx] {
        subContainer.removeLast()
        result += 1
        idx += 1
      }
      else {
        break
      }
    }
  }
  
  
  return result
}
