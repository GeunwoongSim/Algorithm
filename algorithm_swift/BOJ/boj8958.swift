//
//  boj8958.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation
func solution(){
    let T: Int = Int(readLine()!)!
    for _ in 1...T{
        var straight: Int = 0
        var total: Int = 0
        for x in String(readLine()!){
            if String(x) == "O"{
                straight += 1
                total += straight
            }else{
                straight = 0
            }
        }
        print(total)
    }
}
