//
//  boj10871.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let arr = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    for idx in 0..<input[0] {
        if arr[idx] < input[1] { print(arr[idx],terminator: " ") }
    }
}
