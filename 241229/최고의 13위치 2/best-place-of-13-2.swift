let N = Int(readLine()!)!

var map = [[Int]]()

for _ in 0 ..< N {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    map.append(input)
}

var maxCount = 0
let dxs: [Int] = [0, 1, 2]

func isRange(_ x: Int, _ y: Int) -> Bool {
    return 0 <= x && x < N && 0 <= y && y < N
}

// 첫 번째 격자를 놓을 위치를 탐색합니다.
for i in 0 ..< N {
    for j in 0 ..< (N - 2) {
        var cnt1 = 0
        var bar1Coordinates = [(Int, Int)]()

        // 첫 번째 격자의 합과 좌표를 계산합니다.
        for dx in dxs {
            let nx = j + dx
            if isRange(i, nx) {
                cnt1 += map[i][nx]
                bar1Coordinates.append((i, nx))
            }
        }

        // 두 번째 격자를 놓을 위치를 탐색합니다.
        for k in 0 ..< N {
            for l in 0 ..< (N - 2) {
                var cnt2 = 0
                var isOverlapping = false

                // 두 번째 격자의 합을 계산하면서 겹침 여부를 확인합니다.
                for dx in dxs {
                    let nx = l + dx
                    if isRange(k, nx) {
                        // 첫 번째 격자와 겹치면 제외합니다.
                        if bar1Coordinates.contains(where: { $0 == (k, nx) }) {
                            isOverlapping = true
                            break
                        }
                        cnt2 += map[k][nx]
                    }
                }

                // 겹치지 않는 경우 최댓값을 갱신합니다.
                if !isOverlapping {
                    maxCount = max(maxCount, cnt1 + cnt2)
                }
            }
        }
    }
}

print(maxCount)
