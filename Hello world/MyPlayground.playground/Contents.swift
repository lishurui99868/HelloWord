//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
// 字符串
let label = "The width is "
let width = 56
var widthLabel = label + String(width) // swift不支持隐式类型转换，需要显示类型转换
widthLabel += "!"
print(widthLabel)

let apples = 3
let oranges = 5
let applesSummary = "I have \(apples) apples"
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
print(applesSummary)
print(fruitSummary)
print(width)