func solution(_ s:String) -> String {
    var strs: [[String]] = s.components(separatedBy: " ").map{$0.map{String($0)}}
    for strsIdx in 0..<strs.count {
        for idx in 0..<strs[strsIdx].count {
            if strs[strsIdx][idx] >= "0" && strs[strsIdx][idx] <= "9" { continue }
            else if idx == 0 { strs[strsIdx][idx] = strs[strsIdx][idx].uppercased() }
            else { strs[strsIdx][idx] = strs[strsIdx][idx].lowercased() }
        }
    }
    return strs.map{$0.joined()}.joined(separator: " ")
}
