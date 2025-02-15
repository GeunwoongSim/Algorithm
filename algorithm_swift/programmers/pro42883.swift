import Foundation

func solution(_ number:String, _ k:Int) -> String {
  let number = number.map { String($0) }
  var stack: [String] = []
  var k = k
  for num in number {
    if let top = stack.last { // 스택이 비어있지 않은 경우
      if top >= num { // 스택의 top이 나보다 크거나 같으면 스택에 넣음
        stack.append(num)
      }else { // 스택의 top이 나보다 작으면 나보다 크거나 같을 때까지 팝
        // 이때 K를 다쓰면? 거기까지만 하고 프린트?
        while !stack.isEmpty && k > 0 {
          if stack.last! >= num { break }
          k -= 1
          stack.removeLast()
        }
        
        stack.append(num)
      }
    }else { // 스택이 비어있는 경우
      stack.append(num)
    }
  }
  return stack[0..<(stack.count-k)].joined()
}
