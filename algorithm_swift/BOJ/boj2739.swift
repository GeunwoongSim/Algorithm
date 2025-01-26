//
//  boj2739.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let input = Int(readLine()!)!
    (1...9).map{print("\(input) * \($0) = \(input * $0)")}
}
