import Foundation


func timeSplit(_ str: String) -> Int{
    return str.components(separatedBy: ":").reduce(0){ $0 * 60 + Int($1)! }
}
func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    let com: [String: Int] = ["next" : 10, "prev" : -10]
    let op_s: Int = timeSplit(op_start)
    let op_e: Int = timeSplit(op_end)
    let len: Int = timeSplit(video_len)
    var pos: Int = timeSplit(pos)
    
    if (pos >= op_s) && (pos <= op_e) { // 오프닝 위치면 넘김
        pos = op_e
    }
    for command in commands {
        pos += com[command]!
        if pos < 0 { pos = 0 } // 0초 이전이면 0초로 이동
        if pos > len { pos = len } //최대를 넘어가면 최대까지만
        if (pos >= op_s) && (pos <= op_e) { // 오프닝 위치면 넘김
            pos = op_e
        }
    }
    
    //출력 형식 맞추기
    var output: [String] = ["",""]
    output[0] = pos/60 < 10 ? "0\(pos/60)" : "\(pos/60)"
    output[1] = pos%60 < 10 ? "0\(pos%60)" : "\(pos%60)"
    return "\(output[0]):\(output[1])"
}
