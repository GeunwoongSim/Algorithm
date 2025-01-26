import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today: [Int] = today.components(separatedBy: ".").map{Int($0)!}
    var dic: [String : Int] = [:] //종류에 따른 유효기간(Month)
    for term in terms {
        let value = term.components(separatedBy: " ")
        dic[value[0]] = Int(value[1])!
    }

    var comps: [[Int]] = []
    for privacy in privacies {
        //추출
        let value = privacy.components(separatedBy: " ")
        let create = value[0].components(separatedBy: ".").map{Int($0)!}
        let add = dic[value[1]]!
        
        //날짜 변경
        var year = create[0] + (create[1] + add)/12
        var month = (create[1] + add) % 12
        var day = create[2]-1
        if month == 0 {
            year -= 1
            month = 12
        }
        if day == 0 {
            month -= 1
            day = 28
        }
        comps.append([year,month,day])
    }
    
    var result: [Int] = []
    
    for (idx, day) in comps.enumerated() {
        let dd = day[0]*12*28 + day[1]*28 + day[2]
        let td = today[0]*12*28 + today[1]*28 + today[2]
        if td > dd { result.append(idx+1) }
    }
    return result
//    for (idx, day) in comps.enumerated() { // [0]: year, [1]: month, [2]: day
//        if today[0] > day[0] { //ex) 2024년 > 2022년 -> 파기O
//            result.append(idx+1)
//        }else if today[0] == day[0] { //ex) 2022년 == 2022년 -> 월/일 확인
//            if today[1] > day[1] { //ex) 12월 > 5월 -> 파기O
//                result.append(idx+1)
//            }else if today[1] == day[1] { //ex) 5월 == 5월 -> 일 확인
//                if today[2] > day[2] { //ex) 27일 > 20일 -> 파기O
//                    result.append(idx+1)
//                }
//            }
//        }
//    }
//    return result
}





/* DateFormatter 사용 공부 코드 */
//func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
//    var answer: [Int] = []
//
//    let formatter = DateFormatter()
//    formatter.dateFormat = "YYYY.MM.dd"
//
//    let today = formatter.date(from: today)!
//    var termsDict: [String: Int] = [:]
//
//    terms.forEach { term in
//        let split = term.split(separator: " ").map { String($0) }
//        termsDict[split[0]] = Int(split[1])!
//    }
//
//    for (i, privacy) in privacies.enumerated() {
//        let split = privacy.split(separator: " ").map { String($0) }
//
//        guard let date = formatter.date(from: split[0]),
//              let term = termsDict[split[1]] else {
//            continue
//        }
//
//        let month = DateComponents(month: term)
//        let expiration = Calendar.current.date(byAdding: month, to: date)!
//
//        if today >= expiration {
//            answer.append(i + 1)
//        }
//    }
//
//    return answer
//}
