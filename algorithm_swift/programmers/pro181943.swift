import Foundation

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    
    return String(my_string.prefix(s)) + overwrite_string + my_string.suffix(my_string.count-s-overwrite_string.count)
}

/*
 문자열 my_string, overwrite_string과 정수 s가 주어집니다. 문자열 my_string의 인덱스 s부터 overwrite_string의 길이만큼을 문자열 overwrite_string으로 바꾼 문자열을 return 하는 solution 함수를 작성해 주세요.
 He(2) lloWorl(7) d(1)
 "He11oWor1d"(10)    "lloWorl"    2    "HelloWorld"
 */
