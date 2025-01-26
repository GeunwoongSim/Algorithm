//
//  boj9498.swift
//  algorithm_swift
//
//  Created by 심근웅 on 12/30/24.
//

import Foundation

func solution(){
    //시험 점수를 입력받아 90 ~ 100점은 A, 80 ~ 89점은 B, 70 ~ 79점은 C, 60 ~ 69점은 D, 나머지 점수는 F를 출력하는 프로그램을 작성하시오.
    let input = Int(readLine()!)!
    var result: String = ""
    switch input {
    case 90...100 : result = "A"
    case 80...89 : result = "B"
    case 70...79 : result = "C"
    case 60...69 : result = "D"
    default : result = "F"
    }
    print(result)
}
