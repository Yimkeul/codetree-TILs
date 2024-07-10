let input = readLine()!.map { String($0) }
var cnt = 0
for i in 0 ..< input.count {
    for j in i + 1 ..< input.count {
        if input[i] == "(" {
            if input[j] == ")" {
                cnt += 1
            }
        }
    }
}

print(cnt)