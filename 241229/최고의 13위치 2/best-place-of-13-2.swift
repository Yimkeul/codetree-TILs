import Foundation

// 입력 처리
let n = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(row)
}

// 알고리즘 구현
var maxCnt = 0

for i in 0..<n {
    for j in 0..<(n - 2) {
        for k in 0..<n {
            for l in 0..<(n - 2) {
                if i == k && abs(j - l) <= 2 {
                    continue
                }
                
                let cnt1 = arr[i][j] + arr[i][j + 1] + arr[i][j + 2]
                let cnt2 = arr[k][l] + arr[k][l + 1] + arr[k][l + 2]
                maxCnt = max(maxCnt, cnt1 + cnt2)
            }
        }
    }
}

print(maxCnt)
