import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skill: [String] = skill.map{ String($0) }
    var result: Int = 0
    for skill_tree in skill_trees {
        var tree: [String] = []
        for char in skill_tree {
            if skill.contains(String(char)) {
                tree.append(String(char))
            }
        }
        if skillCheck(skill, tree) {
            result += 1
        }
    }
    return result
}
func skillCheck(_ skill: [String], _ tree: [String]) -> Bool {
    var sk_Idx: Int = 0
    var tr_Idx: Int = 0
    while sk_Idx < skill.count && tr_Idx < tree.count {
        if skill[sk_Idx] != tree[tr_Idx] {
            return false
        }
        sk_Idx += 1
        tr_Idx += 1
    }
    return true
}
