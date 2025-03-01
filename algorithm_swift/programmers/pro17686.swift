struct file {
  let name: String // 파일명
  let head: String // 헤더
  let num: Int // 넘버
  let index: Int // 들어온 순서
}

func solution(_ files:[String]) -> [String] {
  let files: [file] = filesConvert(files)
  
  let sortedFiles = files.sorted {
    if $0.head == $1.head {
      if $0.num == $1.num {
        return $0.index < $1.index
      }
      return $0.num < $1.num
    }
    return $0.head < $1.head
  }
  return sortedFiles.map { $0.name }
}

func filesConvert(_ files: [String]) -> [file] {
  var arr: [file] = []
  
  for (idx, contentStr) in files.enumerated() {
    let content = contentStr.map{ String($0) }

    var tempStr: String = ""
    var head: String = ""
    var isHead: Bool = true
    var number: String = ""
    
    for i in 0..<content.count {
      if isHead { // 헤드 부분
        if content[i] == "0" || content[i] == "1" || content[i] == "2" || content[i] == "3" || content[i] == "4" || content[i] == "5" || content[i] == "6" || content[i] == "7" || content[i] == "8" || content[i] == "9" { // 숫자가 등장하면 여기부터 넘버
          head = tempStr.lowercased()
          tempStr = ""
          isHead = false
        }
      }else { // 넘버 부분
        if content[i] != "0" && content[i] != "1" && content[i] != "2" && content[i] != "3" && content[i] != "4" && content[i] != "5" && content[i] != "6" && content[i] != "7" && content[i] != "8" && content[i] != "9" { // 숫자가 아닌게 등장하면 여기부터 테일
          number = tempStr
          tempStr = ""
          break
        }
      }
      tempStr += content[i]
    }
    if tempStr != "" { number = tempStr }
    let data = file(name: contentStr, head: head, num: Int(number)!, index: idx)
    arr.append(data)
  }
  return arr
}
