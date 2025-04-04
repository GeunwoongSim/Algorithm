func solution(_ m:String, _ musicinfos:[String]) -> String {
    // 입력값 변환
    let m = convertM(m).joined()
    
    // musicinfos에서 필요한 정보로 변환 후 정리
    var musics: [(title:String, len: Int, info: String)] = []
    // 최종적으로 필요한 정보
    var result: (title: String, len: Int, info: String) = (title: "", len: -1, info: "")
    
    // 입력값 정리
    for musicinfo in musicinfos {
        // 정보별 분리
        let arr = musicinfo.split(separator: ",").map{ String($0) }
        
        // 필요한 정보
        let title = arr[2]
        let len = convertHToM(value: arr[1]) - convertHToM(value: arr[0])
        let info = playedMusic(info:arr[3], len: len)
        
        musics.append((title, len, info))
    }
    
    // 결과 도출
    for music in musics {
        if music.info.contains(m) && (result.len == -1 || music.len > result.len) {
            result = music
        }
    }
    
    return result.len == -1 ? "(None)" : result.title
}

// "HH:MM"을 입력으로 주면 Int형 플레이한 분을 반환
func convertHToM(value: String) -> Int {
    let valueArr = value.split(separator:":").map{ Int(String($0))! }
    
    return valueArr[0] * 60 + valueArr[1]
}

// 악보 정보와 재생시간을 주면 재생된 전체 악보를 반환
func playedMusic(info: String, len: Int) -> String {
    var infos = convertM(info)
    
    var result: String = ""
    let loop = len / infos.count // 반복횟수 
    let num = len % infos.count // 몇자리까지
    
    for _ in 0..<loop {
        result += infos.joined()
    }
    
    for i in 0..<num {
        result += infos[i]
    }
    
    return result
}

// #이 붙은 음계를 #을 떼고 소문자로 바꿔서 반환
func convertM(_ str: String) -> [String] {
    var result: [String] = []
    var arr = Array(str).map { String($0) }
    
    for cha in arr {
        let str = String(cha)
        if str != "#" {
            result.append(str)
        } else {
            result[result.count-1] += str
        }
    }
    
    for value in result.enumerated() {
        if value.element.contains("#") {
            let arr = Array(value.element).map { String($0) }
            result[value.offset] = arr[0].lowercased()
        }
    }
    
    return result
}