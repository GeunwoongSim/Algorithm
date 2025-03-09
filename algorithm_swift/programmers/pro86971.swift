import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
  var result = 1000
  for value in wires.enumerated() {
    var wires = wires
    let cutting = wires.remove(at: value.offset)
    let num = check(s1: cutting[0], s2: cutting[1], wires: wires)
    result = min(result, num)
  }
  return result
}

func check(s1: Int, s2: Int, wires: [[Int]]) -> Int {
  var wires = wires
  var wiresIdx = 0
  
  var arr1: [Int] = [s1]
  var arr2: [Int] = [s2]
  
  while wiresIdx < wires.count {
    let wire = wires[wiresIdx]
    wiresIdx += 1
    let element1 = wire[0]
    let element2 = wire[1]
    if arr1.contains(element1) {
      arr1.append(element2)
    } else if arr1.contains(element2) {
      arr1.append(element1)
    } else if arr2.contains(element1) {
      arr2.append(element2)
    } else if arr2.contains(element2) {
      arr2.append(element1)
    } else {
      wires.append(wire)
    }
  }
  return max(arr1.count, arr2.count) - min(arr1.count, arr2.count)
}
