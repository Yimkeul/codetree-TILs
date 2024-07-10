let N = Int(readLine()!)!
var grid = [[Int]]()
for _ in 0 ..< N {
    let input = readLine()!.split {$0 == " "}.map{Int($0)!}
    grid.append(input)
}
var maxCoin = 0

// let frame = [0,1,2]

func isVaild(_ index: Int) -> Bool {
    return index < N && index + 1 < N && index + 2 < N
}

for i in 0 ..< N {
    for j in 0 ..< N {
        if isVaild(j) {
            var checkCoin = 0
            for k in j ... j + 2 {
                if grid[i][k] == 1 {
                    checkCoin += 1
                }
            }
            maxCoin = max(maxCoin, checkCoin)
        }
    }
}
print(maxCoin)