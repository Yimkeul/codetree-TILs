import Foundation

// Directions for moving in the grid: up, down, left, right
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// Function to check if the position is within bounds
func isValid(_ x: Int, _ y: Int, _ n: Int) -> Bool {
    return x >= 0 && y >= 0 && x < n && y < n
}

// Function to find the next position to move to
func findNextPosition(_ x: Int, _ y: Int, _ grid: [[Int]]) -> (Int, Int)? {
    let n = grid.count
    var bestPos: (Int, Int)? = nil
    var bestValue = -1
    
    for (dx, dy) in directions {
        let newX = x + dx
        let newY = y + dy
        
        if isValid(newX, newY, n) && grid[newX][newY] < grid[x][y] {
            if grid[newX][newY] > bestValue {
                bestValue = grid[newX][newY]
                bestPos = (newX, newY)
            } else if grid[newX][newY] == bestValue {
                if newX < bestPos!.0 || (newX == bestPos!.0 && newY < bestPos!.1) {
                    bestPos = (newX, newY)
                }
            }
        }
    }
    
    return bestPos
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

let startPosition = readLine()!.split(separator: " ").map { Int($0)! }
var currentX = startPosition[0] - 1
var currentY = startPosition[1] - 1

// Performing the movements
for _ in 0..<k {
    if let nextPos = findNextPosition(currentX, currentY, grid) {
        currentX = nextPos.0
        currentY = nextPos.1
    } else {
        break
    }
}

print("\(currentX) \(currentY)")