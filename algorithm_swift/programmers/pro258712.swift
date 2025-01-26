import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var nextM: [Int] = [Int](repeating: 0, count: friends.count) //다음달에 받을 선물의 수
    var giftMap: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: friends.count), count: friends.count) // [보낸사람][받은사람]
    var giftNumber: [Int] = [Int](repeating: 0, count: friends.count) //선물 지수 - 주면 +1, 받으면 -1
    var friendNum: [String:Int] = [:]
    friends.enumerated().forEach{ friendNum[$0.element] = $0.offset }
    
    for gift in gifts { //선물을 주고 받은 개수 계산
        let send: Int = friendNum[gift.components(separatedBy: " ")[0]]!
        let recieve: Int = friendNum[gift.components(separatedBy: " ")[1]]!
        giftMap[send][recieve] += 1
        giftNumber[send] += 1
        giftNumber[recieve] += -1
    }
    
    for send in friends {
        let send: Int = friendNum[send]!
        for recieve in friends {
            let recieve: Int = friendNum[recieve]!
            if send == recieve || send > recieve { continue } //자기자신한테 주는 경우 패스
            if (giftMap[send][recieve] == 0 && giftMap[recieve][send] == 0) || (giftMap[send][recieve] == giftMap[recieve][send]) { //주고 받은 경우가 없거나 같은 수를 주고 받음
                if giftNumber[send] > giftNumber[recieve] { //선물지수가 더 큰 사람이 받음
                    nextM[send] += 1
                }
                else if giftNumber[send] < giftNumber[recieve]{
                    nextM[recieve] += 1
                }
            }
            else { //한쪽이 주거나, 서로 주고 받지만 횟수가 같지는 않음
                if giftMap[send][recieve] > giftMap[recieve][send] { // send가 더 많이 줌
                    nextM[send] += 1
                }else { //recieve가 더 많이 줌
                    nextM[recieve] += 1
                }
            }
        }
    }
    return nextM.max()!
}
