import Foundation

func solution(_ record:[String]) -> [String] {
    var user: [String: String] = [:] // 유저정보, id에 따른 닉네임
    var chatLogs: [(id: String, enter: Bool)] = [] //현재까지의 출입 기록
    var result: [String] = []
    for logs in record {
        // [0]: 기능, [1]: id, [2]: 닉네임
        let log: [String] = logs.components(separatedBy: " ")
        if log[0] == "Enter" {
            chatLogs.append((id: log[1], true))
            user[log[1]] = log[2] // 닉네임 저장
        }
        else if log[0] == "Leave" {
            chatLogs.append((id: log[1], false))
        }
        else {
            user[log[1]] = log[2] // 닉네임 저장
        }
    }
    
    for chatLog in chatLogs {
        let nickname: String = user[chatLog.id]!
        let str: String = nickname + (chatLog.enter ? "님이 들어왔습니다." : "님이 나갔습니다.")
//        print(str)
        result.append(str)
    }
    return result
}
