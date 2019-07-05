import Foundation
import UIKit



func filterNumberArray_3(sourceArray: [Int], filter: (Int) -> Bool, completion: (([Int]) -> Void)? = nil ){
    var result = [Int]()
    sourceArray.forEach { (number) in
        if filter(number) {
            result.append(number)
        }
    }
    completion?(result)
}


func filterNumberArray_2(sourceArray: [Int], filter: (Int) -> Bool, completion: (([Int]) -> Void)){
    var result = [Int]()
    sourceArray.forEach { (number) in
        if filter(number) {
            result.append(number)
        }
    }
    completion(result)
}

func filterNumberArray_1(sourceArray: [Int], filter: ((Int) -> Bool)? = lessThan5) -> [Int] {
    var result = [Int]()
    sourceArray.forEach { (number) in
        if filter!(number) {
            result.append(number)
        }
    }
    return result
}

func filterNumberArray_4(sourceArray: [Int], filter: @escaping (Int) -> Bool, completion: @escaping (([Int]) -> Void) ) {
    DispatchQueue.global().async {
        print(Thread.current)
        var result = [Int]()
        for (index, number) in sourceArray.enumerated() {
            if filter(number) {
                result.append(number)
            }
        }
        DispatchQueue.main.async {
            completion(result)
        }
    }
}

func filterNumberArray(sourceArray: [Int], filter: (Int) -> Bool) -> [Int] {
    var result = [Int]()
    sourceArray.forEach { (number) in
        if filter(number) {
            result.append(number)
        }
    }
    return result
}

func lessThan5(_ number: Int) -> Bool {
    return number < 5
}

func GreaterOrEqualTo4(_ number: Int) -> Bool{
    return number >= 4
}

let sourceArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]

_ = filterNumberArray(sourceArray: sourceArray, filter: lessThan5)

_ = filterNumberArray(sourceArray: sourceArray, filter: GreaterOrEqualTo4)

_ = filterNumberArray_1(sourceArray: sourceArray)

filterNumberArray_2(sourceArray: sourceArray, filter: lessThan5) { (result) in
    print("reuslt_", result)
}

filterNumberArray_3(sourceArray: sourceArray, filter: GreaterOrEqualTo4) { (result) in
    print("result__", result)
}





