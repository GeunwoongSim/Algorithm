//
//  boj10818.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation
func solution(){
    var minN: Int = Int.min
    var maxN: Int = Int.max
    
    let _ = readLine()!
    let inp: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
//    print(inp.min()!, inp.max()!)
    
    for num in inp{
        if minN == Int.min || minN > num { minN = num }
        if maxN == Int.max || maxN < num { maxN = num }
    }
    print(minN, maxN)
}
