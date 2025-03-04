import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
  var q1: [Int] = []
  var q2: [Int] = []
  var q1Sum: Int = 0, q2Sum: Int = 0
  var q1Max: Int = -1, q2Max: Int = -1
  var q1Idx: Int = 0, q2Idx: Int = 0
  var result: Int = 0
  let MAX_RESULT: Int = (queue1.count + queue2.count) * 2
  // 초기값 설정
  for idx in 0..<queue1.count {
    q1.append(queue1[idx])
    q1Sum += queue1[idx]
    q2.append(queue2[idx])
    q2Sum += queue2[idx]
    q1Max = max(q1Max, queue1[idx])
    q2Max = max(q2Max, queue2[idx])
  }
  // 합이 홀수면 못구하므로 -1 반환
  if (q1Sum + q2Sum) % 2 == 1 {
    return -1
  }
  // 큐의 요소 이동
  while q1Sum != q2Sum {
    // 최대 이동 횟수를 넘어가면 -1 반환
    if result > MAX_RESULT {
       return -1
    }
    // 합이 큰 큐에서 하나를 빼서 다른 한쪽에 넣음
    if q1Sum > q2Sum {
      let num = q1[q1Idx]
      q1Idx += 1
      q1Sum -= num
      q2Sum += num
      q2.append(num)
    }else {
      let num = q2[q2Idx]
      q2Idx += 1
      q1Sum += num
      q2Sum -= num
      q1.append(num)
    }
    result += 1
  }
  return result
}
