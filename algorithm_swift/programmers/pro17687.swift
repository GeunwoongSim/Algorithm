func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
  var T: Int = 0 // 출력한 숫자의 개수
  var num: Int = -1 // 현재 숫자
  var numStack: [String] = []
  var P: Int = 0 // 현재 차례
  var result: [String] = []
  while T < t {
    if numStack.isEmpty { // 숫자가 떨어지면 리필
      num += 1
      let str = String(num,radix: n)
      str.reversed().forEach{ numStack.append(String($0.uppercased())) }
    }
    let tell = numStack.removeLast()
    if P == (p-1) {
      result.append(tell)
      T += 1
    }
    P = (P + 1) % m
  }
  return result.joined()
}
