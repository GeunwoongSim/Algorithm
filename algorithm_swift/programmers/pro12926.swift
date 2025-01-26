func solution(_ s:String, _ n:Int) -> String {
    return s.map{
        let asciiNum: Int = Int($0.asciiValue!)
        if $0 == " " {
            return " "
        }else if asciiNum >= 65 && asciiNum <= 90 { //대문자
            let num = (asciiNum + n - 65) % 26
            return String(Unicode.Scalar(65 + num)!)
        }else { //소문자
            let num = (asciiNum + n - 97) % 26
            return String(Unicode.Scalar(97 + num)!)
        }
    }.joined()
}
