func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
  var b: [[String]] = board.reversed().map { $0.map { String($0) } }
  var checkPos: [(Int,Int)] = [] // 지워질 블록의 위치
  var result: Int = 0
  
  while true {
    // 지워하는 블록을 찾음
    for y in 0..<m-1 {
      for x in 0..<n-1 {
        if b[y][x] == "-1" { continue }
        else if b[y][x] == b[y][x+1] && b[y][x] == b[y+1][x] && b[y][x] == b[y+1][x+1] {
          checkPos.append((y,x))
        }
      }
    }
    if checkPos.isEmpty { break }
    // 블록들을 지움
    while !checkPos.isEmpty {
      let pos = checkPos.removeLast()
      for y in 0...1 {
        for x in 0...1 {
          if b[pos.0+y][pos.1+x] != "-1" {
            result += 1
            b[pos.0+y][pos.1+x] = "-1"
          }
        }
      }
    }
    // 전체 블록들을 재정렬
    for y in 0..<m {
      for x in 0..<n {
        if b[y][x] == "-1" {
          for yi in y..<m {
            if b[yi][x] != "-1" {
              b[y][x] = b[yi][x]
              b[yi][x] = "-1"
              break
            }
          }
        }
      }
    }
  }
  return result
}
