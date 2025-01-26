//
//  boj2920.swift
//  algorithm_swift
//
//  Created by 심근웅 on 1/4/25.
//

import Foundation

func solution(){
    let inp: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    if inp[0] == 1 && inp[1] == 2 && inp[2] == 3 && inp[3] == 4 && inp[4] == 5 && inp[5] == 6 && inp[6] == 7 && inp[7] == 8 {
        print("ascending")
    }
    else if inp[7] == 1 && inp[6] == 2 && inp[5] == 3 && inp[4] == 4 && inp[3] == 5 && inp[2] == 6 && inp[1] == 7 && inp[0] == 8{
        print("descending")
    }
    else{
        print("mixed")
    }
}
