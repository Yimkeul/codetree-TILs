// let NM = readLine()!.split { $0 == " "}.map { Int($0)! }
// var arrayA = readLine()!.split { $0 == " "}.map { Int($0)! }
// var arrayB = readLine()!.split { $0 == " "}.map { Int($0)! }

// var cnt = 0
// if NM[0] < NM[1] {
//     print(cnt)
// } else {
//     for i in 0 ... NM[0] - NM[1] {
//         var isTrue = false
//         var tempArray = arrayB
//         // print("\(i) - \(arrayA[i]) : ")
//         for j in i ..< i + NM[1] {
//             if tempArray.contains(arrayA[j]) {
//                 isTrue = true
//                 if let index = tempArray.firstIndex(of: arrayA[j]) {
//                     _ = tempArray.remove(at: index)
//                 }
//             } else { 
//                 isTrue = false
//                 break
//             }
//             // print(arrayA[j] , terminator: " ")
//         }
//         if isTrue {
//             cnt += 1
//         }
//     }
//     print(cnt)
// }



import Foundation

// 입력 받기
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

let arr1 = readLine()!.split(separator: " ").map { Int($0)! }
let arr2 = readLine()!.split(separator: " ").map { Int($0)! }

// arr2를 정렬 (미리 정렬하여 비교에 사용)
let sortedArr2 = arr2.sorted()

// 모든 구간의 시작점을 잡아봅니다.
var cnt = 0
if n < m {
    print(cnt)
} else {
    for i in 0...(n - m) {
        // 슬라이싱한 배열 정렬
        let subArray = Array(arr1[i..<i+m]).sorted()
    
        // 두 배열이 동일한지 비교
        if subArray == sortedArr2 {
            cnt += 1
        }
    }

    print(cnt)

}