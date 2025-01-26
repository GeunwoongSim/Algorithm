//
//  boj11720.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    readLine()
    let result: Int = readLine()!.map{Int(String($0))!}.reduce(0,+)
    print(result)
}

