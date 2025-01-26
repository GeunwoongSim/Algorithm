import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result: [String:Int] = [:] //정상적으로 정지되어 받을 이메일 횟수
    let report: Set<String> = Set<String>(report) //report에서 중복을 제거
    var recieveReport: [String:Int] = [:] //신고 받은 횟수를 담은 딕셔너리
    var stopList: [String:Bool] = [:] //정지된 ID목록
    for report in report { //신고횟수 누적
        let report = report.components(separatedBy: " ")
        recieveReport[report[1]] = (recieveReport[report[1]] ?? 0) + 1
    }
    
    for recieve in recieveReport { //정지될 ID 리스트에 저장
        if recieve.value >= k { stopList[recieve.key] = true }
    }
    
    for report in report { //신고된 내용중 정지될 리스트에 있다면 해당 사람의 신고횟수 + 1
        let report = report.components(separatedBy: " ")
        if stopList[report[1]] ?? false { result[report[0]] = (result[report[0]] ?? 0) + 1 }
    }
    return id_list.map { result[$0] ?? 0 }
}
