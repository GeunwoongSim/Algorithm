func solution(_ s:String) -> String {
//    return s.components(separatedBy: " ").map{
//        $0.enumerated().map{
//            $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased()
//        }.joined()
//    }.joined(separator: " ")
    
    
//    let arr: [String] = s.components(separatedBy: " ")
//    var result: String = ""
//    for idx in 0..<arr.count {
//        let str: String = arr[idx]
//        for cha in str.enumerated() {
//            if cha.offset % 2 == 0 { result += String(cha.element.uppercased()) }
//            else { result += String(cha.element.lowercased()) }
//        }
//        if idx != arr.count-1 {
//            result += " "
//        }
//    }
//    return result
    
    
    var arr: [String] = s.components(separatedBy: " ")
    for str in arr.enumerated() {
        var edit: [String] = str.element.map{ String($0) }
        for cha in edit.enumerated() {
            if cha.offset % 2 == 0 { edit[cha.offset] = cha.element.uppercased() }
            else { edit[cha.offset] = cha.element.lowercased() }
        }
        arr[str.offset] = edit.joined()
    }
    return arr.joined(separator: " ")
}
