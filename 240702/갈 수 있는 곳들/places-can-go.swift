// let nk = readLine()!.split {$0 == " "}. map{Int($0)!}
// let (n,k) = (nk[0], nk[1])
// var graph = [[Int]]()

// for _ in 0 ..< n {
//     let input = readLine()!.split {$0 == " "}. map{Int($0)!}
//     graph.append(input)
// }

// for _ in 0 ..< k {
//     let rc = readLine()!.split {$0 == " "}. map{Int($0)!}
//     let (r,c) = (rc[0], rc[1])
// }

import Foundation

// Directions for moving in the grid: up, down, left, right
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// Function to check if the position is within bounds and not a blocked cell
func isValid(_ x: Int, _ y: Int, _ grid: [[Int]], _ visited: [[Bool]]) -> Bool {
    return x >= 0 && y >= 0 && x < grid.count && y < grid[0].count && grid[x][y] == 0 && !visited[x][y]
}

// Function to perform BFS and count reachable cells
func bfs(_ grid: [[Int]], _ startPoints: [(Int, Int)]) -> Int {
    var queue = startPoints
    var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
    
    for (x, y) in startPoints {
        visited[x][y] = true
    }
    
    var count = 0
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        count += 1
        
        for (dx, dy) in directions {
            let newX = x + dx
            let newY = y + dy
            
            if isValid(newX, newY, grid, visited) {
                visited[newX][newY] = true
                queue.append((newX, newY))
            }
        }
    }
    
    return count
}

// Reading input
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let k = firstLine[1]

var grid = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
}

var startPoints = [(Int, Int)]()
for _ in 0..<k {
    let point = readLine()!.split(separator: " ").map { Int($0)! }
    let r = point[0] - 1
    let c = point[1] - 1
    startPoints.append((r, c))
}

let reachableCells = bfs(grid, startPoints)
print(reachableCells)