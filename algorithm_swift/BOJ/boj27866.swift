//
//  boj27866.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let input = readLine()!.map{String($0)}
    let idx = Int(readLine()!)!
    print(input[idx-1])
}
