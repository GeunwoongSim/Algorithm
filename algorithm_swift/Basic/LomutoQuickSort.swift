//
//  QuickSort.swift
//  algorithm_swift
//
//  Created by 심근웅 on 2/4/25.
//

import Foundation

func LomutoQuickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) { // lo: 첫 인덱스, hi: 마지막 인덱스
    if lo < hi { // 정상적인 범위면
        let pivot = LomutoPartition(&list, lo: lo, hi: hi)
        
        LomutoQuickSort(&list, lo: lo, hi: pivot-1) // lo ~ pivot 전
        LomutoQuickSort(&list, lo: pivot+1, hi: hi) // pivot 후 ~ hi
    }
}
// 정렬을 해주고 pivot의 위치를 반환
func LomutoPartition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> Int {
    let pivot = list[hi] // pivot으로 할 값을 잡아두고
    var i = lo // pivot보다 큰 값의 위치
    //pivot 보다 작은 값은 큰값 보다 앞으로 보냄
    for j in lo..<hi {
        if list[j] <= pivot {
            list.swapAt(i, j) // 큰값중 가장 앞 자리에 작은 값을 옮겨놓음
            i += 1
        }
    }
    list.swapAt(i, hi) // 현 상황에서 i는 pivot보다 큰값중 인덱스가 가장 작은 수, pivot과 자리를 바꿈 -> pivot보다 앞쪽은 작은수 뒷쪽은 큰수
    return i // pivot의 위치를 반환
}
