import Foundation

//func solution(_ n:Int, _ computers:[[Int]]) -> Int {
//  var isCheck: [Bool] = [Bool](repeating: false, count: n)
//  var queue: [Int] = []
//  var queIdx: Int = 0
//  var result: Int = 0
//  
//  for startIdx in 0..<computers.count {
//    if isCheck[startIdx] == true { continue }
//    
//    queue.append(startIdx)
//    while queIdx < queue.count { // 큐가 빌때까지 진행
//      let netA = queue[queIdx]
//      queIdx += 1
//      isCheck[netA] = true
//      for (idx, network) in computers[netA].enumerated() { // idx: 수신네트워크, network: 연결상태
//        if network == 1 && !isCheck[idx] { // 수신네트워크는 검사를 안했으며 현재 네트워크와 연결되어있음
//          queue.append(idx) // 네트워크를 큐에 추가
//        }
//      }
//    }
//    result += 1 // 네트워크 개수 +1
//  }
//  return result
//}
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
  var isCheck: [Bool] = [Bool](repeating: false, count: n)
  var queue: [Int] = []
  var queIdx: Int = 0
  var result: Int = 0
  
  for startIdx in 0..<computers.count {
    if isCheck[startIdx] == true { continue }
    
    queue.append(startIdx)
    while queIdx < queue.count { // 큐가 빌때까지 진행
      let netA = queue[queIdx]
      queIdx += 1
      isCheck[netA] = true
      for (idx, network) in computers[netA].enumerated() { // idx: 수신네트워크, network: 연결상태
        if network == 1 && !isCheck[idx] { // 수신네트워크는 검사를 안했으며 현재 네트워크와 연결되어있음
          queue.append(idx) // 네트워크를 큐에 추가
        }
      }
    }
    result += 1 // 네트워크 개수 +1
  }
  return result
}
