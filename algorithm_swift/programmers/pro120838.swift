import Foundation

func solution(_ letter:String) -> String {
    let morse: [String:String] = [
        ".-":"a","-...":"b","-.-.":"c","-..":"d",".":"e","..-.":"f",
        "--.":"g","....":"h","..":"i",".---":"j","-.-":"k",".-..":"l",
        "--":"m","-.":"n","---":"o",".--.":"p","--.-":"q",".-.":"r",
        "...":"s","-":"t","..-":"u","...-":"v",".--":"w","-..-":"x",
        "-.--":"y","--..":"z"
    ]
    return letter.components(separatedBy: " ").map{ morse[$0]! }.joined()
    
    
    let arr: [String] = letter.components(separatedBy: " ")
    return arr.map{ morse[$0]! }.joined()
}
