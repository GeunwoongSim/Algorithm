import Foundation

func solution(_ msg:String) -> [Int] {
  let msg = msg.map{ String($0) }
  var msgIdx = 0
  var dic: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  var str: String = ""
  var idx: Int = -1
  var result: [Int] = []
    
    while msgIdx < msg.count {
      str = str + msg[msgIdx]
      
      if let firstIndex = dic.firstIndex(of: str) {
        idx = firstIndex
        msgIdx += 1
      }else {
        result.append(idx + 1)
        idx = -1
        dic.append(str)
        str = ""
      }
    }
  if let firstIndex = dic.firstIndex(of: str) {
    result.append(firstIndex+1)
  }
    return result
}
