import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    var num1: Int = denom2*numer1 + denom1*numer2
    var num2: Int = denom1 * denom2
//    //분모 분자 중에서 작은수부터 1로 가면서 나누어봄
    for idx in (1...min(num1,num2)).reversed(){
        if (num1%idx == 0) && (num2%idx == 0) {
            num1 = num1 / idx
            num2 = num2 / idx
            break
        }
    }
    return [num1,num2]
    
    //2부터 나누어감
    var idx: Int = 2
    while idx <= num2 {
        if (num1%idx == 0) && (num2%idx == 0) {
            num1 = num1 / idx
            num2 = num2 / idx
        }else {
            idx += 1
        }
    }
    return [num1, num2]
}

/*
 첫 번째 분수의 분자와 분모를 뜻하는 numer1, denom1, 두 번째 분수의 분자와 분모를 뜻하는 numer2, denom2가 매개변수로 주어집니다. 두 분수를 더한 값을 기약 분수로 나타냈을 때 분자와 분모를 순서대로 담은 배열을 return 하도록 solution 함수를 완성해보세요.
 
 1    2    3    4    => [5, 4]
 */
