//
//  boj31403.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation

func solution(){
    let numA: Int = Int(readLine()!)!
    let numB: Int = Int(readLine()!)!
    let numC: Int = Int(readLine()!)!
    print(numA+numB-numC)
    let numD: Int = Int(String(numA) + String(numB)) ?? 0
    print(numD-numC)
}
