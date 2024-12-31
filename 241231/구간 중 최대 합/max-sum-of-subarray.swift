let nk = readLine()!.split { $0 == " "}.map { Int($0)! }
let line = readLine()!.split { $0 == " "}.map { Int($0)! }

var ans = Int.min


for i in 0 ... nk[0] - nk[1] {
    var temp = 0
    for j in i ..< i + nk[1] {
        temp += line[j]
    }
    ans = max(temp, ans)
}
print(ans)