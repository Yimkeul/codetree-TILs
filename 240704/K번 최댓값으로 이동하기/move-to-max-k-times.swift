// 입력 받기
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nk[0]
    let k = nk[1]

    var grid = [[Int]]()
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        grid.append(row)
    }

    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    var currCell = (rc[0] - 1, rc[1] - 1)

    var bfsQueue = [(Int, Int)]()
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)

    func inRange(x: Int, y: Int) -> Bool {
        return 0 <= x && x < n && 0 <= y && y < n
    }

    func canGo(x: Int, y: Int, targetNum: Int) -> Bool {
        return inRange(x: x, y: y) && !visited[x][y] && grid[x][y] < targetNum
    }

    func initializeVisited() {
        for i in 0..<n {
            for j in 0..<n {
                visited[i][j] = false
            }
        }
    }

    func bfs() {
        let dxs = [0, 1, 0, -1]
        let dys = [1, 0, -1, 0]
        
        var (currX, currY) = currCell
        visited[currX][currY] = true
        bfsQueue.append(currCell)
        
        let targetNum = grid[currX][currY]
        
        while !bfsQueue.isEmpty {
            let (currX, currY) = bfsQueue.removeFirst()
            
            for i in 0..<4 {
                let newX = currX + dxs[i]
                let newY = currY + dys[i]
                
                if canGo(x: newX, y: newY, targetNum: targetNum) {
                    bfsQueue.append((newX, newY))
                    visited[newX][newY] = true
                }
            }
        }
    }

    func needUpdate(bestPos: (Int, Int)?, newPos: (Int, Int)) -> Bool {
        if bestPos == nil {
            return true
        }
        
        let (bestX, bestY) = bestPos!
        let (newX, newY) = newPos
        
        return (grid[newX][newY], -newX, -newY) > (grid[bestX][bestY], -bestX, -bestY)
    }

    func move() -> Bool {
        initializeVisited()
        bfs()
        
        var bestPos: (Int, Int)? = nil
        for i in 0..<n {
            for j in 0..<n {
                if !visited[i][j] || (i, j) == currCell {
                    continue
                }
                
                let newPos = (i, j)
                if needUpdate(bestPos: bestPos, newPos: newPos) {
                    bestPos = newPos
                }
            }
        }
        
        if bestPos == nil {
            return false
        } else {
            currCell = bestPos!
            return true
        }
    }

    for _ in 0..<k {
        let isMoved = move()
        if !isMoved {
            break
        }
    }

    let (finalX, finalY) = currCell
    print(finalX + 1, finalY + 1)