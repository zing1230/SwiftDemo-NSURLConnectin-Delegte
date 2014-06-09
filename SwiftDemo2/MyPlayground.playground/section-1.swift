// Playground - noun: a place where people can play

import Cocoa
import Foundation


var str = "Hello, playground"

class Person{
    let name: String;
    init(name:String){
        self.name = name;
        println("\(name) is being initialized");
    }
    
    deinit{
        println("\(name) is being deinitialized");
    }
    
}

var refrence1:Person!
var refrence2:Person?
var refrence3:Person?

refrence1 = Person(name: "zhulei");
refrence2 = refrence1;
refrence3 = refrence1;

refrence1 = nil;
refrence2 = nil;
refrence3 = nil;



//数组使用方法
var shoppingList = ["Eggs" , "Milk"];
shoppingList += "ann"

//数组的数量
shoppingList.count

//是否为空
if shoppingList.isEmpty{}

//添加一个元素
shoppingList.append("Flour")
shoppingList += "Baking Powder"

//添加一个数组
shoppingList += ["s1","s2"];

//第一个元素
var fistItem = shoppingList[0]

//替换第五个元素
shoppingList[5] = "h5"

//指定下标插入
shoppingList.insert("H0",atIndex:0)


shoppingList.count
//移出第0个元素
let h0 = shoppingList.removeAtIndex(0)
shoppingList.count

//移出最后一个元素
let last = shoppingList.removeLast()

//遍历整个组值中的for-in循环数组：
for item in shoppingList {
    println(item)
}

//遍历并且同时获取下标
for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}

//创建和初始化一个数组.
var someInts = Int[]()
println("someInts is of type Int[] with \(someInts.count) items.")
//
someInts += 3
someInts.append(3)

//初始化5个2.1 count 数量, repeatedValue重复值
var threeDoubles = Double[](count:5,repeatedValue:2.1);

//自动默认就是Double类型了
var anotherDoubles = Array(count:5,repeatedValue:1.2);

//var anotherDoubles = Array<Double>(count:5,repeatedValue:1.2);

var some = threeDoubles + anotherDoubles;










//字典操作
//Dictionary<KeyType, ValueType>

//初始化字典,key和value都是String类型的.
var airports:Dictionary<String,String> = ["TYO":"Tokyo","DUB":"Bulin"];

//元素数量
airports.count

//添加元素
airports["LHR"] = "London"

//替换LHR
airports["LHR"] = "London Heathrow"

//updateValue 替换DUB
let oldValue = airports.updateValue("Dublin International",forKey:"DUB");

//获取key为TYO 的 value
var airportname = airports["TYO"]
println("airportname \(airportname)");

airports["APL"] = "Apple International"
airportname = airports["APL"]


//移出key为"APL"的 元素
airports["APL"] = nil;

//移出key为"DUB"的 元素
var removedValue = airports.removeValueForKey("DUB");

//遍历字典
for (airportCode,airportName) in airports{
    println("airportCode \(airportCode) airportName \(airportName)");
}

//遍历所有的key
for airportCode in airports.keys{
    println("airportCode \(airportCode)");
}

//遍历所有的value
for airportValue in airports.values{
    println("airportValue \(airportValue)");
}

//key 数组
let airportCodes = Array(airports.keys)
//value 数组
let airportNames = Array(airports.values)



//创建一个空的字典 key是int类型, value是String类型
var namesOfIntegers = Dictionary<Int,String>();

namesOfIntegers[16] = "sixteen"

//置空
namesOfIntegers = [:]



//Closure 闭包操作
//The Sort Function 排序操作
let names:Array<String> = ["Alex","Sidney","King","Zing","Eva"]

//pred 条件
func backforwards(s1:String , s2:String)->Bool{
    return s1 > s2;
}
//使用sort排序
//func sort<T>(array: T[], pred: (T, T) -> Bool) -> T[]
var reserved = sort(names, backforwards)

//Closure Expression Syntax 闭包表达方式
/*
Closure expression syntax has the following general form:

{ (parameters) -> return type in
    statements
}
*/

//闭包表达方式 排序
reserved = sort(names, {(s1:String , s2:String) -> Bool in s1 < s2 })

//“Inferring Type From Context” 从内容推理
reserved = sort(names, {s1, s2 in return s1 > s2 })
for value in reserved{
    println("value \(value)")
}

//“Implicit Returns from Single-Expression Closures”
reserved = sort(names, { s1, s2 in s1 > s2 })
for value in reserved{
    println("value \(value)")
}

//Shorthand Argument Names
//“ $0 and $1 refer to the closure’s first and second String arguments.”
reserved = sort(names, {$0 > $1})

for value in reserved{
    println("value \(value)")
}

//Operator Functions
reserved = sort(names, >)
for value in reserved{
    println("value111 \(value)")
}



reserved = sort(names){$0 > $1}
for value in reserved{
    println("value___ \(value)")
}

let digitNames = [
0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{
    (var number) ->String in
    var output = "";
    while number > 0{
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output;
}


//返回一个函数类型是 ()->Int  不是一个值
func makeIncrementor(forIncrement amount:Int) ->() ->Int{
    var runningTotal = 0;
    func incrementor()->Int{
        runningTotal += amount;
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen();//10
incrementByTen();//20
incrementByTen();//30

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()//7

incrementByTen();//40


let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

