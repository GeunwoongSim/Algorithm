import Foundation

func solution(_ babbling:[String]) -> Int {
    let cans: [String] = [ "aya", "ye", "woo", "ma" ]
    var inp: [String] = babbling
    for idx in 0..<inp.count{
        for can in cans {
            inp[idx] = inp[idx].replacingOccurrences(of: can, with: "*")
        }
        inp[idx] = inp[idx].replacingOccurrences(of: "*", with: "")
    }
    return inp.filter{$0.count==0}.count
    
    
    
    
    
    var coms: [[String]] = [cans,[],[],[]]
    
    //단어 조합 생
    for idx in 0...2{
        var arr: [String] = []
        for com in coms[idx] {
            for can in cans{
                if !com.contains(can){
                    arr.append(com+can)
                }
            }
        }
        coms[idx+1] = arr
    }
    let comp: [String] = coms.flatMap{ $0 }
    var result: Int = 0
    for com in comp{
        for str in babbling {
            if str == com{
                result += 1
            }
        }
    }
    
    
    return result
}

/*
 머쓱이는 태어난 지 6개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음을 최대 한 번씩 사용해 조합한(이어 붙인) 발음밖에 하지 못합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.
 
 
 ["aya", "yee", "u", "maa", "wyeoo"]   =>  1
 */
