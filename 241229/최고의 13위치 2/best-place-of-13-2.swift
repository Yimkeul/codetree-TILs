let N = Int(readLine()!)!

var map = [[Int]]()

for _ in 0 ..< N {
    let input = readLine()!.split { $0 == " "}.map { Int($0)! }
    map.append(input)
}


var bar1 = 0
var check1:(Int,Int) = (0,0)
var check2:(Int,Int) = (0,0)
var bar2 = 0

var dxs: [Int] = [0,1,2]

for i in 0 ..< N {
    for j in 0 ..< N {
        var curx = j
        var temp = 0
        for dx in dxs {
            var nx = curx + dx
            if !isRange(i,nx) {
                break
            }
            if map[i][nx] == 1 {
                temp += 1
            }
            if dx == 2 {
                if bar1 < temp {
                    bar1 = temp
                    check1 = (i,j)
                    check2 = (i,j + 2)
                    // print("bar1",bar1,check1,check2)
                }
            }
        }
        
    }
}

for i in 0 ..< N {
    for j in 0 ..< N {
        var curx = j
        var temp = 0
        for dx in dxs {
            var nx = curx + dx
            if !isRange(i,nx) || (i,nx) == check1 || (i,nx) == check2 {
                break
            }
            if map[i][nx] == 1 {
                temp += 1
            }
            if dx == 2 {
                if bar2 < temp {
                    bar2 = temp
                    // print("bar2",bar2,i,j)
                }
            }
        }
        
    }
}
print(bar1 + bar2)

func isRange(_ x: Int, _ y: Int) -> Bool {
    return 0 <= x && x < N && 0 <= y && y < N
}

