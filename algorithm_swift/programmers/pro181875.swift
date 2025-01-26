import Foundation

func solution(_ strArr:[String]) -> [String] {
    return strArr.enumerated().map{ $0.offset%2==0 ? $0.element.lowercased() : $0.element.uppercased() }
}

/*
 문자열 배열 strArr가 주어집니다. 모든 원소가 알파벳으로만 이루어져 있을 때,
 배열에서 홀수번째 인덱스의 문자열은 모든 문자를 대문자로, 짝수번째 인덱스의 문자열은 모든 문자를 소문자로 바꿔서 반환하는 solution 함수를 완성해 주세요.
 */
