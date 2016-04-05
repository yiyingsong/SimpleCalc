//  main.swift
//  SimpleCalc
//
//  Created by apple on 4/3/16.
//  Copyright © 2016 apple. All rights reserved.
//
//  Assignment 2: SimpleCalc
//  Yiying Song

import Foundation

// change input to string
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding)
        as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

print("Enter an expression separated by returns")
let firstInput = input()
let whitespace = NSCharacterSet.whitespaceCharacterSet()
let range = firstInput.rangeOfCharacterFromSet(whitespace)

// checks if the input has whitespaces
if let test = range {
    // if the input has whitespace, it means this asks for extended operations
    let separated = firstInput.componentsSeparatedByString(" ")
    if separated.last == "count" {
        print(separated.count - 1)
    } else if separated.last == "avg" {
        var sum : Int? = 0
        // goes through all the input number and calculates the average
        for index in 0...separated.count-2 {
            sum = sum! + Int(separated[index])!
        }
        var length = separated.count - 1
        print(sum! / length)
    } else {
        var last : Int? = Int(separated[0])
        // calcualtes the factorial
        func factorial(last: Int) -> (Int) {
            if (last <= 1) {
                return 1
            } else {
                return last * factorial(last - 1)
            }
        }
        print(factorial(last!))
    }
}
else {
    
    // if there is no whitespace, it means it asks for simple calculation
    // converts the input string to integer
    var firstNum : Int? = Int(firstInput)
    var symbol = input()
    var secondNum : Int? = Int(input())
    var result : Int

    if symbol == "+" {
        result = firstNum! + secondNum!
    } else if symbol == "-"{
        result = firstNum! - secondNum!
    } else if symbol == "*" {
        result = firstNum! * secondNum!
    } else if symbol == "/" {
        result = firstNum! / secondNum!
    } else {
        result = firstNum! % secondNum!
    }

    print("Result: \(result)")
}






