let N = Int(readLine()!)!
let cows = readLine()!.split { $0 == " "}.map {Int($0)!}

var cnt = 0

for i in 0 ..< N {
    for j in i + 1 ..< N {
        for k in j + 1 ..< N {
            if i < j && j < k {
                if cows[i] <= cows[j] && cows[j] <= cows[k] {
                    cnt += 1
                }
            }
        }
    }
}
print(cnt)