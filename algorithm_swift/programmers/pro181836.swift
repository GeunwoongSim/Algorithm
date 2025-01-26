import Foundation

func solution(_ picture:[String], _ k:Int) -> [String] {
    return picture.flatMap{ Array(repeating: $0.map{ String(repeating: $0, count: k)}.joined(), count: k) }

    //가로로 k번 -> 세로로 k번
    var  result: [String] = []
    for pic in picture{
        for _ in 0..<k {
            var str: String = ""
            for cha in pic {
                for _ in 0..<k {
                    str += String(cha)
                }
            }
            result.append(str)
        }
    }
    return result
}


/*
 직사각형 형태의 그림 파일이 있고, 이 그림 파일은 1 × 1 크기의 정사각형 크기의 픽셀로 이루어져 있습니다. 이 그림 파일을 나타낸 문자열 배열 picture과 정수 k가 매개변수로 주어질 때, 이 그림 파일을 가로 세로로 k배 늘린 그림 파일을 나타내도록 문자열 배열을 return 하는 solution 함수를 작성해 주세요.
 
 
 [".xx...xx.", "x..x.x..x", "x...x...x", ".x.....x.", "..x...x..", "...x.x...", "....x...."]    2
 ["..xxxx......xxxx..", "..xxxx......xxxx..", "xx....xx..xx....xx", "xx....xx..xx....xx", "xx......xx......xx", "xx......xx......xx", "..xx..........xx..", "..xx..........xx..", "....xx......xx....", "....xx......xx....", "......xx..xx......", "......xx..xx......", "........xx........", "........xx........"]
 */
