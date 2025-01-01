import Foundation

// 입력 받기
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

// 모든 구간을 잡아봅니다.
var cnt = 0

for i in 0..<n { // 구간의 시작점을 잡아봅니다.
    for j in i..<n { // 구간의 끝점을 잡아봅니다.
        // 구간 [i, j] 내 원소의 합을 구합니다.
        var sumInterval = 0
        for k in i...j {
            sumInterval += arr[k]
        }

        // 평균을 구합니다.
        let avg = Double(sumInterval) / Double(j - i + 1)

        // 구간 내에 원소 평균값과 동일한 원소가 있으면 개수를 세줍니다.
        var exists = false
        for k in i...j {
            if Double(arr[k]) == avg {
                exists = true
                break
            }
        }

        if exists {
            cnt += 1
        }
    }
}

// 결과 출력
print(cnt)
