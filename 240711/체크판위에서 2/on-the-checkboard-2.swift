import Foundation

// 입력을 읽고 파싱합니다.
let RC = readLine()!.split { $0 == " " }.map { Int($0)! }
let (R, C) = (RC[0], RC[1])
var grid = [[String]]()

for _ in 0 ..< R {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    grid.append(input)
}

// 이동 가능한 경로의 수를 세는 변수
var cnt = 0

// 모든 가능한 쌍을 찾아봅니다.
for i in 1 ..< R {
    for j in 1 ..< C {
        for k in (i + 1) ..< R {
            for l in (j + 1) ..< C {
                // 색깔이 모두 다른 경우만 카운트합니다.
                if grid[0][0] != grid[i][j] && 
                   grid[i][j] != grid[k][l] && 
                   grid[k][l] != grid[R - 1][C - 1] {
                    cnt += 1
                    break
                }
            }
        }
    }
}

// 결과를 출력합니다.
print(cnt)