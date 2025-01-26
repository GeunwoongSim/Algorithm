//
//  boj10951.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    while let input = readLine() {
        print(input.components(separatedBy: " ").reduce(0){$0+Int($1)!})
    }
}
