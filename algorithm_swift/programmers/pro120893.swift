import Foundation

func pro120893(_ my_string:String) -> String {
//    return my_string.reduce("", {
////        return $0+($1 >= "a" && $1 <= "z" ? $1.uppercased() : $1.lowercased())
//        return $0+($1.isLowercase ? $1.uppercased() : $1.lowercased())
//    })
    return my_string.map{
        $0.isLowercase ? $0.uppercased() : $0.lowercased()
    }.joined()
    
}

/*
    $1 >= "a" && $1 <= "z" 부분은 $1.isLowercase()로 확인 가능
 */
