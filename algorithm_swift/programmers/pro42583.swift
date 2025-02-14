import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var tructOnBridge: [(Int,Int)] = [] // $0: 트럭의 무게, $1: 다리에서의 위치
    var time: Int = 0
    var truckIdx: Int = 0 // 다음에 올라갈 트럭의 인덱스
    
    repeat {
        // 트럭을 1칸씩 이동
        for i in 0 ..< tructOnBridge.count {
            tructOnBridge[i].1 += 1
        }
        // 이동한 트럭의 위치가 다리를 벗어나면 삭제 - 빠질 수 있는 건 젤앞의 트럭만
        if let first = tructOnBridge.first, first.1 > bridge_length {
            tructOnBridge.removeFirst()
        }
        // 새로운 트럭이 올라올 수 있으면 올림
        let weightSum: Int = tructOnBridge.reduce(into: 0){ $0 += $1.0 }
        if truckIdx < truck_weights.count {
            if weightSum + truck_weights[truckIdx] <= weight {
                tructOnBridge.append((truck_weights[truckIdx], 1))
                truckIdx += 1
            }
        }
        time += 1
    } while !tructOnBridge.isEmpty
    return time
}
