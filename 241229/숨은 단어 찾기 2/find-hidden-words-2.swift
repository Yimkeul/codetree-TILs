let NM = readLine()!.split { $0 == " " }.map { Int($0)! }

    var map = [[String]]()

    for _ in 0 ..< NM[0] {
        let input = readLine()!.map { String($0) }
        map.append(input)
    }

    let directions = zip([1, 1, 1, -1, -1, -1, 0, 0], [-1, 0, 1, -1, 0, 1, -1, 1])

    var cnt = 0


    for i in 0 ..< NM[0] {
        for j in 0 ..< NM[1] {
            if map[i][j] != "L" {
                continue
            }

            for (dx, dy) in directions {
                var curt = 1
                var curx = i
                var cury = j
                while true {
                    let nx = curx + dx
                    let ny = cury + dy
                    if !isValid(nx, ny) {
                        break
                    }
                    if map[nx][ny] != "E" {
                        break
                    }
                    curt += 1
                    curx = nx
                    cury = ny
                }
                if curt >= 3 {
                    cnt += 1
                }
            }
        }
    }

    print(cnt)

    func isValid(_ x: Int, _ y: Int) -> Bool {
        return 0 <= x && x < NM[0] && 0 <= y && y < NM[1]
    }
