import Foundation

func solution(_ s1:[String], _ s2:[String]) -> Int {
    
    let s1Set: Set<String> = Set(s1)
    let s2Set: Set<String> = Set(s2)

    let inter: Set<String> = s1Set.intersection(s2Set)


    return inter.count
}