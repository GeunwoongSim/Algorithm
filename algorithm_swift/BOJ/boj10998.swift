//
//  boj10998.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    print(input[0] * input[1])
}
