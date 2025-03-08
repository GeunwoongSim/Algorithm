import Foundation

func solution(_ weights:[Int]) -> Int64 {
  var weightMap: [Int : [Int]] = [:] // key: 무게, value: 해당 무게를 만들 수 있는 weight(idx)
  var dupleMap: [Int : Int] = [:] // key weights에 담긴 무게, value: 중복 개수
  // 중복 개수
  weights.forEach { dupleMap[$0, default: 0] += 1 }
  // 무게(2,3,4배)에 따른 개수
  weights.enumerated().forEach {
    weightMap[$0.element * 2, default: []].append($0.offset)
    weightMap[$0.element * 3, default: []].append($0.offset)
    weightMap[$0.element * 4, default: []].append($0.offset)
  }
  // 짝꿍의 수
  let result = weightMap.reduce(0) { $0 + $1.value.count * ($1.value.count-1) / 2 }
  // 중복 계산된 짝궁의 수
  let t: Int = dupleMap.reduce(0) { $0 + $1.value * ($1.value - 1) }
  return Int64(result-t)
}
