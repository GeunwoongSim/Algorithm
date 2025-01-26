//
//  boj2753.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    let input = Int(readLine()!)!
    let result = ((input%4 == 0) && ((input%100 != 0) || (input%400 == 0))) ? "1" : "0"
    print(result)
}
