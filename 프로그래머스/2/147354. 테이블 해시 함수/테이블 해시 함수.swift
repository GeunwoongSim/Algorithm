import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    var arr: [[String]] = []
    
    // 입려된 데이터 정렬
    var data = data.sorted(by: {
        if $0[col-1] == $1[col-1] {
            return $0[0] > $1[0]
        }
        return $0[col-1] < $1[col-1]
    })
    
    for i in (row_begin-1)..<row_end {
        var S: Int = 0
        for num in data[i] {
            S += num % (i+1)
        }
        let temp = String(S, radix: 2).reversed().map{ String($0) }
        arr.append(temp)
    }
    
    var result = arr[0]
    for i in 1..<arr.count {
        result = calculateXOR(A: result, B: arr[i])
    }
    return Int(result.reversed().reduce("", +), radix: 2)!
}

func calculateXOR(A: [String], B: [String]) -> [String] {
    var result: [String] = []
    var aIdx: Int = 0
    var bIdx: Int = 0
    while aIdx < A.count && bIdx < B.count {
        if A[aIdx] == B[bIdx] {
            result.append("0")
        } else {
            result.append("1")
        }
        aIdx += 1
        bIdx += 1
    }
    result += A[aIdx..<A.count]
    result += B[bIdx..<B.count]
    return result
}