import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
  var queue: [(Int, Int)] = [(y, 0)] // $0: 숫자, $1: 횟수
  var lenStore: [Int:Int] = [:] // key: 숫자, value: 최소 걸린 횟수 - queue와는 다름
  var idx: Int = 0
  var num: Int = 0
  var len: Int = 0
  let MAX: Int = 1000002
  while idx < queue.count {
    num = queue[idx].0 // 현재 숫자
    len = queue[idx].1 // 현재 숫자를 만든 숫자
    idx += 1
    
    if num-n >= x {
      let temp = lenStore[num-n, default: MAX]
      if len+1 < temp { // 횟수가 더 작을때만 업데이트 하고 큐에넣음
        lenStore[num-n] = len+1
        queue.append((num-n, len+1))
      }
    }
    if num/2 >= x && num%2 == 0 {
      let temp = lenStore[num/2, default: MAX]
      if len+1 < temp { // 횟수가 더 작을때만 업데이트 하고 큐에넣음
        lenStore[num/2] = len+1
        queue.append((num/2, len+1))
      }
    }
    if num/3 >= x && num%3 == 0 {
      let temp = lenStore[num/3, default: MAX]
      if len+1 < temp { // 횟수가 더 작을때만 업데이트 하고 큐에넣음
        lenStore[num/3] = len+1
        queue.append((num/3, len+1))
      }
    }
  }
  return x == y ? 0 : lenStore[x, default: -1]
}
