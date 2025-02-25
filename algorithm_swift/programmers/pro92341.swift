import Foundation

func solution(_ fees: [Int], _ records: [String]) -> [Int] {
  var recordsDic: [String : [Int]] = [:]
  var fee: [String : Int] = [:]
  
  // 차량 출입기록 정리
  for record in records {
    let arr = record.split(separator: " ").map{ String($0) } // input 분리
    let times = arr[0].split(separator: ":") // 시,분 분리
    recordsDic[arr[1], default: []].append(Int(times[0])! * 60 + Int(times[1])!) // 출입 시간을 초단위로 저장
  }
  // 나간 기록이 없는 차량은 23:59에 나간걸로 처리
  for record in recordsDic {
    if record.value.count % 2 == 1 { // 들어가고 나간 기록이 있으면 짝수
      recordsDic[record.key]?.append(23*60+59)
    }
  }
  
  // 주차된 시간을 구함 -> 시간을 요금으로 바꿈
  for record in recordsDic {
    var idx: Int = 0
    // 주차 시간을 저장
    while idx < record.value.count {
      fee[record.key, default: 0] += (record.value[idx+1] - record.value[idx])
      idx += 2
    }
    var result: Int = 0 // 주차 요금 = (주차시간 - 기본주차시간) / 단위시간 * 단위요금
    if fee[record.key]! <= fees[0] { // 기본 시간 이하로 주차
      result = fees[1] // 기본요금만 내면됨
    }
    else if (fee[record.key]! - fees[0]) % fees[2] != 0 { // 올림이 필요한 경우
      result = fees[1] + ((fee[record.key]! - fees[0]) / fees[2] + 1) * fees[3]
    }else { // 올림이 필요하지 않는 경우
      result = fees[1] + (fee[record.key]! - fees[0]) / fees[2] * fees[3]
    }
    // 주차 요금을 저장
    fee[record.key] = result
  }
  
  return fee.sorted(by: { $0.key < $1.key }).map{ $0.value }
}
