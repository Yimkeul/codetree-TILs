import Foundation

var dicSet = Set<String>()  // 중복 방지용 Set
var dicList = [String]()    // 등록 순서를 유지하는 리스트

while let line = readLine(), line != "end" {
    let words = line.split(separator: " ").map { String($0) }
    
    for word in words {
        if !dicSet.contains(word) {  // 단어가 사전에 없다면 추가
            dicSet.insert(word)
            dicList.append(word)      // 등록 순서 유지
        }
    }
    
    // 현재 사전 상태를 등록 순으로 출력
    print(dicList.joined(separator: " "))
}
