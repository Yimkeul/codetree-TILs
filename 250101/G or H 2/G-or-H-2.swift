// let N = Int(readLine()!)!

// if N ==  1 {
//     print(0)
// } else {
//     var dic = [Int:String]()
//     var SumG = [Int](repeating: 0, count: N + 1)
//     var SumH = [Int](repeating: 0, count: N + 1)
//     for i in 1 ..< N + 1 {
//         let input = readLine()!.split { $0 == " " }
//         let (position, info) = (Int(input[0])!, String(input[1]))
//         dic[position] = info
//         if info == "G" {
//             SumG[i] = SumG[i - 1] + 1
//             SumH[i] = SumH[i - 1]
//         } else {
//             SumH[i] = SumH[i - 1] + 1
//             SumG[i] = SumG[i - 1]
//         }
//     }
//     var sameIndex = 0
//     for i in 0 ..< SumG.count {
//         if SumG[i] == 
//     }

//     var sortedDic = dic.sorted { $0.key < $1.key}
//     print(sortedDic)
//     print(SumG)
//     print(SumH)
// }



let MAX_NUM = 100

// 변수 선언 및 입력
let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: MAX_NUM + 1)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let x = Int(input[0])!
    let c = input[1]
    
    arr[x] = (c == "G") ? 1 : 2
}

// 모든 구간의 시작점을 잡아봅니다.
var maxLen = 0

for i in 0..<MAX_NUM + 1 {
    for j in i + 1..<MAX_NUM + 1 {
        // i와 j 위치에 사람이 있는지 확인합니다.
        if arr[i] == 0 || arr[j] == 0 {
            continue
        }
        
        // 해당 구간 내 G와 H의 개수를 구합니다.
        var cntG = 0
        var cntH = 0
        
        for k in i...j {
            if arr[k] == 1 {
                cntG += 1
            }
            if arr[k] == 2 {
                cntH += 1
            }
        }
        
        // 조건을 만족할 때 구간의 길이를 구해 최댓값과 비교합니다.
        if cntG == 0 || cntH == 0 || cntG == cntH {
            let length = j - i
            maxLen = max(maxLen, length)
        }
    }
}

print(maxLen)
