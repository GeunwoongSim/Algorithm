import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players: [String] = players //위치에 따른 플레이어 기록
    var dic: [String:Int] = [:]
    players.enumerated().forEach{ dic[$0.element] = $0.offset }
    
    for calling in callings {
        let idx: Int = dic[calling]! //해설자가 부른 플레이어의 위치
        let swapP: String = players[idx-1] //해설자가 부른 플레이어의 앞에 위치한 플레이어
        dic[swapP] = idx // 해설자가 부른 플레이어의 앞에 있던 플레이어는 등수가 한칸 뒤로
        dic[calling] = idx-1 //등수 변경 - 해설자가 부른 플레이어는 등수가 한칸 앞으로
        players.swapAt(idx-1, idx) //플레이어 위치 변경에 따라 위치에 따른 플레이어 기록 변경
    }
    return players
}

