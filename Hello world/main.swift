//
//  main.swift
//  Hello world
//
//  Created by 李姝睿 on 20/2/16.
//  Copyright © 2016年 李姝睿. All rights reserved.
//

import Foundation

print("Hello, World!") // 输出函数，跟Cocoa中的NSLog函数是一个意思
// 类似推导：编译器在编译的时候，通过你提供的初始化的值，自动推导出特定的表达式的值
var myVaraiable = 23
myVaraiable = 50 // 变量多次赋值的时候需要保证值的类型是相同的
print(myVaraiable)
// 常量 不能被2次修改1·
let myConstant = 12
// 显示声明类型
let double:Double = 40.0
let int:Int8 = 10

// Swift不会自动给变量赋初始值，也就是说变量不会有默认值，所以要求在使用变量之前必须要对其初始化
//var noValue

var π = 3.14
var 你好 = "你好世界"
var 🐶 = "dog"
let min = UInt8.min
let max = UInt8.max
print(min,max)

// 类型别名：使用typealias关键字定义类型别名，类似typedef
typealias NSInteger = Int
var value:NSInteger = 34
value = 12

var tigerIsAnimal: Bool = true
var animalIsTiger = false

// ---------------- 字符串 -----------------
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

// ------------------- 数组的用法 ------------------
let emptyArray1 = [] // 声明一个空的数组
let emptyArray2 = [Int ]() // 声明一个空的数组，先顶了值的类型为Int
var shoppingList = ["芒果","橘子","水","葡萄","香蕉"] // 声明一个5个字符串类型元素的数组
print(shoppingList.capacity)

// 增加
shoppingList.append("苹果") // 往数组里面添加一个元素
print(shoppingList)

shoppingList.insert("🍌", atIndex: 3)
print(shoppingList)

//shoppingList += "柚子"
print(shoppingList)

shoppingList += ["🍉","木瓜"]
print(shoppingList)
// 常用方法
print(shoppingList.count) // 数组的个数
print(shoppingList.capacity)
print(shoppingList.isEmpty) // 判断数组是否为空
// 修改
shoppingList[1] = "🍈" // 修改第一个元素的值
print(shoppingList)

shoppingList[4...7] = ["火龙果","榴莲","Apple"] // 除了能替换值之外，还能改变数组的个数
print(shoppingList)
// 删除
shoppingList.removeFirst() // 删除第一个元素
print(shoppingList)

shoppingList.removeAtIndex(4) // 删除指定位置元素
print(shoppingList)

//shoppingList.removeAll() // 删除所有元素
//print(shoppingList)

// 数组遍历
for item in shoppingList {
    print(item)
}
//for (index, value) in enumerate(shoppingList) {
//    print("item \(index + 1):\(value)")
//}

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
print(threeDoubles)

var anotherThreeDouble = Array(count: 3, repeatedValue: 2.5)
print(anotherThreeDouble)

var sixDoubles = threeDoubles + anotherThreeDouble
print(sixDoubles)

// ----------------- 字典 -------------------
let emptyDic1 = [:] // 声明一个空的字典
let emptyDic2 = Dictionary<String, Float>() // 声明一个空的字典，key为String类型，value为Float类型
var airports = ["TYO":"Tokyo","DUB":"Dublin"]
print(airports)

// 添加\修改
airports["TYO"] = "Tokyo International" // 查找原来的字典，如果原来的字典包含此key，那么就把原来对应的value换成新的value，如果没有找到，那么就是往字典里面添加一对新的值
print(airports)
airports["LHR"] = "London"
print(airports)
// 删除
airports["LHR"] = nil
print(airports)
airports.removeValueForKey("TYO")
print(airports)
// 输出count
print("airports count is " + String(airports.count))
print("airports count is \(airports.count)")
// 字典遍历
for (key, value) in airports {
    print("\(key):\(value)")
}
// 遍历所有的key
for key in airports.keys {
    print(key)
}
// 遍历所有的value
for value in airports.values {
    print(value)
}

let allKeys = Array(airports.keys)
let allValues = Array(airports.values)
print(allKeys)
print(allValues)

// --------------- 元组的使用 -----------------
let (x, y) = (1, 2) // 定义一个简单的元组
print("x is \(x) and y is \(y)")
// 元组创建2
let http404Error = (404, "Not Found") // 定义一个由Int和String组成的元素
print(http404Error)
// 访问元组的值1
let (statusCode, statusMessage) = http404Error // 采用类似Dictionary的方式，通过key去拿到值
print("statusCode is \(statusCode) and statusMessage is \(statusMessage)")
// 访问元组的值2
// 如果仅需要元组中个别的值，可以使用“_”的方式来忽略不需要的值
let (justTheStatusCode,_) = http404Error
print(justTheStatusCode)
// 访问元组的值3，使用序号
print("status code is \(http404Error.0)")
print("message code is \(http404Error.1)")

// 元组创建3
let http200Status = (statusCode : 200, desc : "OK")
print("The stauts code is \(http200Status.statusCode)")

// -------------- 可选类型 -----------------
// 可选类型表示：这个值要么存在，并且等于x，要么不存在
let possibleNumber = "123"
//let convertedNumber: Int? = possibleNumber.toInt()

var responseCode: Int? = 404 // 要么存在，且值为404
responseCode = nil // 要么不存在，可以赋值为nil表示不存在
// 可选类型类似于Objective-C中指针的nil值，但是nil只对类（class）有用，指对象不存在，而Swift的nil不是指针，他代表特定类型的值不存在。任何类型的可选类型都能赋值为nil，而不仅限于对象类型。并且更安全。
/* 1.Swift里面nil不能用于非可选类型 
   2.如果代码中的常量或者变量需要适配值不存在的情况，务必将他声明为恰当的可选类型
   3.如果定义的可选类型的对象不提供默认值，该对象将自动设为nil
 */
var strValue: String? = "hello"
let hashValue = strValue?.hashValue // ？的意思是询问可选量是否响应后面这个方法
print("hashValue is \(hashValue)")
/* 总结 ？的使用场景
   1.声明Optional变量
   2.用在Optional值操作中，用来判断是否响应后面的操作
 */

// ------------- 解包 ---------------
/* 解包（！的用法）
    如果确定一个可选类型的对象的值一定存在，那么我们使用！进行解包获取它的值，或者使用Optional Binding
 */
let possibleString : String? = "An optional string"
print(possibleString!) // 解包，我确定possibleString的值一定存在，不需要每次都验证他的值是否存在
let stringValue = possibleString!.hashValue // 必须解包，才能获取可选量的属性或者方法
// Optional Binding，等价于上面一行
if  let sValue = possibleString {
    let stringValue = sValue.hashValue
}

// 隐式解包的可选类型
// 你可以把隐式解包可选类型当成对每次使用的时候自动解包的可选类型。即不是每次使用的时候在变量\常量后面加！，而是直接在定义的时候加！
let assumedString : String! = "An implicitly unwrapped optional string"
print(assumedString)
print(assumedString.hashValue)
/* 总结 ！的使用场景
   1.强制对可选量进行解包
   2.声明隐式解包的可选类型的时候，一般用于类中的属性
 */

let b = 10
var a = 5
a = b
print(a)
// 2.数学运算符
var x1 = 1 + 2
var x2 = 10.5 / 2.5
// 两个字符串通过+号组成一个新的字符串
let dog : Character = "🐶"
let cow : Character = "🐮"
//let dogCow = dog + cow
// 2.1取余，余数运算符
var x3 = 9 % 4
print(x3)
// 2.2浮点数取余
var x4 = 8 % 2.5
print(x4)
// 2.3增量与减量运算符
var x5 = 0
let y1 = ++x5
let y2 = x5++
print("y1:\(y1), y2:\(y2), x5:\(x5)")
// 2.4复合赋值操作符
var x6 = 1
x6 += 2 // 等价于x6 = x6 + 2
print(x6)
// 2.5一元减运算符
let three = 3
let minusThree = -three
let plusThree = -minusThree
print(minusThree)
print(plusThree)
// 2.6一元加运算符，一元加运算符返回的值，不做任何的变动
let minusSix = -6
let alsoMinusSix = +minusSix
print(alsoMinusSix)
// 5.三目运算符
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)
// 6.范围运算符
// 6.1封闭范围运算符，(a...b)定义了一个范围从a到b，并且包含a和b的值
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 6.2半封闭范围运算符（包头不包尾），(a..b)定义了范围从a到b，包含a的值，但是不包含b的值
let names = ["Anna","Alex","Brian","Jack"]
let count = names.count
//for i in 0..count {
//    print("Person \(i) is called \(names[i])")
//}
// 7.逻辑运算符
// 7.1逻辑非运算符
let entry = false
if (!entry) {
    print("ok")
}
// 7.2逻辑与运算符
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome")
} else {
    print("access denied")
}
// 7.3逻辑或运算符
if enteredDoorCode || passedRetinaScan {
    print("Welcome")
} else {
    print("access denied")
}

// ------------ 字符与字符串 -------------
// 1.字符
let money : Character = "¥"
var face : Character = "😂"
//print(money+face)
// 2.字符串
// Swift中的字符串不是指针，而是实际的值
let someString = "ABC"
var someStr = "ABC"
/**
*  字符串常量可以包括下面这些特殊字符：
空字符\0,反斜杠\,制表符\t,换行符\n,回车符\r,双引号\"和单引号\'
单字节Unicode字符，\xnn,其中nn是两个十六进制数
双字节Unicode字符，\unnnn其中nnnn是四个十六进制数
四字节Unicode字符，\Unnnnnnnn,其中nnnnnnnn是八个十六进制数
*/
let words = "\""
//let dollarSign = "\x24" //$
//let blackHeart = "\u2665"
//let sparkHeart = "\U0001F4"
// 2.1初始化一个空的字符串
var emptyString = ""
var anotherEmptyString = String()
// 检查字符串是否为空
if emptyString.isEmpty {
    print("Nothing to see here")
}
// 3.变长字符串
var variableString = "Horse"
variableString += " and carriage"
print(variableString)
// 4.字符计数
let countStr = "wu xian hu lian"
//print("countStr count is \(countElements(countStr))")
// 5.组合字符串与字符
let string1 = "Hello"
let string2 = " there"
let character1 : Character = "!"
let character2 : Character = "?"
//let stringPlusCharacter = string1 + character1
//let stringPlusString = string1 + string2
//let characterPlusString = character1 + string1
//let characterPlusCharacter = character1 + character2
// 6.字符串格式化
let sum = 3
print("sum is \(sum), sum double is \(Double(sum) * 2.5)")
// 7.字符串比较
// 7.1字符串相等
let someStr1 = "ABC"
let SomeStr2 = "ABC"
if someStr1 == SomeStr2 {
    print("someStr1 == SomeStr2")
}
// 7.2前缀相等
let animals = ["食肉：老虎","食肉：狮子","食草：牛群","食草：羊群","食草：马群"]
var aCount = 0
var bCount = 0
for animal in animals {
    if animal.hasPrefix("食肉") {
        ++aCount
    }
    if animal.hasSuffix("群") {
        ++bCount
    }
}
print("这有\(aCount)头食肉动物")
print("这有\(bCount)群食草动物")
// 8.字符串大小写
let normal = "Could you help me, please?"
let shouty = normal.uppercaseString
print("shouty: " + shouty)
let whispered = normal.lowercaseString
print("whispered: " + whispered)
// 9.字符串编码
let dogString = "Dog!🐶"
// utf-8
for codeUnit in dogString.utf8 {
    print("\(codeUnit)")
}
print("\n")
// utf-16
for codeUnit in dogString.utf16 {
    print("\(codeUnit)")
}
print("\n")
// unicode 标量
for scalar in dogString.unicodeScalars {
    print("\(scalar)")
    print("\(scalar.value) ")
}

// -------------- 流程控制 ------------------
// for - in
for index in 1...5 {
    print("index is \(index)")
}
// 如果不需要知道区间内每一项的值，可以使用（_）来代替变量名忽略对该值的访问
// 求3的10次幂
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("answer is \(answer)")
// for - in 遍历数组
let nameArr = ["Anna","Alex","Brian","Jack"]
for name in nameArr {
    print("name is \(name)")
}
// for - in 遍历字典
let numberOfLegs = ["spider" : 8,"ant" : 6,"cat" : 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// for - in 遍历字符串
//for character in "Hello" {
//    print(character)
//}
// for 条件递增
for var index = 0; index < 3; ++index {
    print("index is \(index)")
}
// while循环
var va = 1
while va < 5 {
    print("while index is \(va)")
    va++
}
// do while
var vb = 1
repeat{
    print("do while index is \(vb)")
    vb++
}while vb < 5
// if
let 今天天气不错 = true
if 今天天气不错 {
    print("我们就去爬山")
} else {
    print("我们在家撸代码")
}
// switch
let charA : Character = "A"
switch charA {
    case "a","A": // 如果想匹配多个条件，可以使用（,）隔开
        print("The letter a")
    case "A": // 每一个case分支中必须包含至少一条语句
        print("The letter A")
    default:
        print("default")
}
// case分支的模式也可以是一个值的区间范围
let counts = 3_000_000_000
let countedThings = "stars in the Milky Way"
var naturalCount : String
switch counts {
case 0 :
    naturalCount = "no"
case 1...3 :
    naturalCount = "a few"
case 4...9 :
    naturalCount = "several"
case 10...99 :
    naturalCount = "tens of"
case 1000...999_999 :
    naturalCount = "thousands of"
default :
    naturalCount = "millions and millions of"
}
print("There are \(naturalCount) \(countedThings)")
// 匹配元组.(x, y)坐标
let somePoint = (1, 1)
switch somePoint {
case (0, 0) :
    print("(0, 0) is ar the origin")
case (_, 0) :
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _) :
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2) :
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default :
    print("(\(somePoint.0), \(somePoint.1)) is outside the box")
}
// 值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 1) : // 此时x只是一个占位符，用来临时获取switch条件中的一个或者多个值
    print("x value is \(x)")
case (0, let y) :
    print("y value is \(y)")
case let (x, y) :
    print("somewhere else at (\(x),\(y))")
}
// where 附加条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y :
    print("case 0")
case let (x, y) where x == -y :
    print("case 1")
case let (x, y) :
    print("case 2")
}
// 控制传递语句
// continue
for index in 1...5 {
    if index == 3 {
        continue
    }
    print("index is \(index)")
}
// 贯穿fallthrough
let integer = 5
var desc = "The number \(integer) is"
switch integer {
case 2,3,5,7,11 : // 质数
    desc += " a prime number, and also"
    fallthrough
default :
    desc += " an integer"
}
print("desc is \(desc)")
// 标签语句
// 根据分数评等级
var score = [98, 87, 34, 100, 75, 68, -5, 99]
First : for s in score { // 题目要求碰到异常的分数，直接终止循环
    switch s / 10 {
    case 10 :
        continue First
    case 9 :
        print("\(s) 分为优秀")
    case 8 :
        print("\(s) 分为良好")
    case 7 :
        print("\(s) 分为中等")
    case 0 :
        break First // 使用标签，终止for循环。如果这里没有使用标签，break终止的将是switch
    default :
        print("\(s) 分为不及格")
    }
}










