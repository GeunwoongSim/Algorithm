import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    
    var result: [Double] = [] // 최종 구간 넓이
    var paths: [Int] = [] // 1로 만드는 순서
    var sizes: [Double] = [0] // 각 구간의 넓이
    var k = k
    
    // 1로 만들기
    while k > 1 {
        paths.append(k)
        if k % 2 == 0 { k = k / 2 }
        else { k = k * 3 + 1 }
    }
    paths.append(k)
    
    // 넓이 누적 합
    for idx in 1..<paths.count {
        let minN = Double(min(paths[idx], paths[idx-1]))
        let maxN = Double(max(paths[idx], paths[idx-1]))
        
        let value = (minN + maxN) / 2 + sizes[idx-1]
        // let value = ((maxN - minN) / 2 + minN) + sizes[idx-1]
        
        sizes.append(value)
    }
    
    // 구간 넓이 구하기
    for range in ranges {
        let a = range[0]
        let b = (paths.count-1) + range[1]
        
        if a > b {
            result.append(-1)
        } else if a == b { 
            result.append(0)
        } else {
            let value = sizes[b] - sizes[a]
            result.append(value)
        }
    }
    
    return result
}