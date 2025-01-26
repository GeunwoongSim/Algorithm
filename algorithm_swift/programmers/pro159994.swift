import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var cards1: [String] = cards1
    var cards2: [String] = cards2
    var result: String = "Yes"
    goal.forEach{
        if $0 == cards1.first { cards1.removeFirst() }
        else if $0 == cards2.first { cards2.removeFirst() }
        else { result = "No" }
    }
    return result
    
    
    var goal: [String] = goal
    while !goal.isEmpty {
        if cards1.isEmpty && cards2.isEmpty { return "No" } // 둘다 비어있음
        else if !cards1.isEmpty && cards2.isEmpty { // 1은 비어있지 않음
            if cards1.first != goal.first { return "No" }
            else { 
                cards1.removeFirst()
                goal.removeFirst()
            }
        }else if cards1.isEmpty && !cards2.isEmpty { //2은 비어있지 않음
            if cards2.first != goal.first { return "No" }
            else {
                cards2.removeFirst()
                goal.removeFirst()
            }
        }else { //둘다 비어있지 않음
            if cards1.first == goal.first {
                cards1.removeFirst()
                goal.removeFirst()
            }else if cards2.first == goal.first {
                cards2.removeFirst()
                goal.removeFirst()
            }else{ return "No" }
        }
    }
    return "Yes"
}
