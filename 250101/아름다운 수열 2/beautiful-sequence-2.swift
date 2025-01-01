let NM = readLine()!.split { $0 == " "}.map { Int($0)! }
let arrayA = readLine()!.split { $0 == " "}.map { Int($0)! }
let arrayB = readLine()!.split { $0 == " "}.map { Int($0)! }

var cnt = 0
for i in 0 ... NM[0] - NM[1] {
    var isTrue = false
    for j in i ..< i + NM[1] {
        if arrayB.contains(arrayA[j]) {
            isTrue = true
        } else { 
            isTrue = false
            break
        }
    }
    if isTrue {
        cnt += 1
    }
}
print(cnt)