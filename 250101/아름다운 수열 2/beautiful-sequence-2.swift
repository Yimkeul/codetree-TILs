let NM = readLine()!.split { $0 == " "}.map { Int($0)! }
var arrayA = readLine()!.split { $0 == " "}.map { Int($0)! }
var arrayB = readLine()!.split { $0 == " "}.map { Int($0)! }

var cnt = 0
if NM[0] < NM[1] {
    print(cnt)
} else {
    for i in 0 ... NM[0] - NM[1] {
        var isTrue = false
        var tempArray = arrayB
        // print("\(i) - \(arrayA[i]) : ")
        for j in i ..< i + NM[1] {
            if tempArray.contains(arrayA[j]) {
                isTrue = true
                if let index = tempArray.firstIndex(of: arrayA[j]) {
                    _ = tempArray.remove(at: index)
                }
            } else { 
                isTrue = false
                break
            }
            // print(arrayA[j] , terminator: " ")
        }
        if isTrue {
            cnt += 1
        }
    }
    print(cnt)
}



