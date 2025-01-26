//
//  boj3052.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation

func solution(){
    var result: Set<Int> = Set<Int>()
    for _ in 1...10{
        let num: Int = Int(readLine()!)!
        result.insert(num%42)
    }
    print(result.count)
}
