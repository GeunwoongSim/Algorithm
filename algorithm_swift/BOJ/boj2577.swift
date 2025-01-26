//
//  boj2577.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation

func solution(){
    let A = Int(readLine()!)!
    let B = Int(readLine()!)!
    let C = Int(readLine()!)!
    var result: [Int] = [Int](repeating: 0, count: 10)
    for c in String(A * B * C) {
        result[Int(String(c))!] += 1
    }
    for num in result{
        print(num)
    }
}
