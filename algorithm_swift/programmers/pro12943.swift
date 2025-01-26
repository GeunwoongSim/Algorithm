func solution(_ num:Int) -> Int {
    var idx: Int = 0
    var number: Int = num
    while idx <= 500 && number != 1 {
        if number % 2 == 0 {
            number = number / 2
        }else {
            number = number * 3 + 1
        }
        idx += 1
    }
    return idx > 500 ? -1 : idx
}
