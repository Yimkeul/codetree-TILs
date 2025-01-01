let NM = readLine()!.split { $0 == " "}.map { Int($0)! }
var arrayA = readLine()!.split { $0 == " "}.map { Int($0)! }
var arrayB = readLine()!.split { $0 == " "}.map { Int($0)! }

var A = NM[0]
var B = NM[1]
if NM[0] < NM[1] {
    var temp = arrayB
    arrayB = arrayA
    arrayA = temp
    A = NM[1]
    B = NM[0]
}



var cnt = 0
for i in 0 ... A - B {
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