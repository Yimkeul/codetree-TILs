import Foundation

let MAX_NUM = 100

// 입력 받기
let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]

// 배열 초기화
var arr = [Int](repeating: 0, count: MAX_NUM + 1)

// 입력 데이터를 배열에 저장
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let x = input[1]
    arr[x] += a
}

// 모든 구간의 시작점을 잡아봅니다.
var maxSum = 0
for i in 0...MAX_NUM {
    // 해당 구간 내 원소의 합을 구합니다.
    var sumAll = 0
    for j in max(0, i - k)...min(MAX_NUM, i + k) {
        sumAll += arr[j]
    }
    // 최댓값을 구합니다.
    maxSum = max(maxSum, sumAll)
}

print(maxSum)
