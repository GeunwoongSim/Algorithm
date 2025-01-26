//
//  boj10952.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    
    while let input = readLine() {
        let num = input.components(separatedBy: " ").map{ Int($0)! }
        if num[0] == 0 && num[1] == 0 { break }
        else { print(num[0] + num[1]) }
    }
}
