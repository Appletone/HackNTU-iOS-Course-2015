// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str1 = str
str += " !!!"
str
str1

// Int
let foo = 23
var bar: Double = 42
bar = bar/Double(foo)

// for in
for i in 1..<30 {
    i*i
}

// UIView
let view = UIView(frame: CGRectMake(0, 0, 250, 250))
view.backgroundColor = UIColor.blueColor()
view.layer.cornerRadius = 125.0
view.alpha = 0.5

// UILabel
let myLabel = UILabel(frame: CGRectMake(0, 0, 200, 50))
myLabel.backgroundColor = UIColor.redColor()
myLabel.text = "Hello Swift"
myLabel.textAlignment = .Center
myLabel.font = UIFont(name: "Georgia", size: 24)
myLabel

// UIImage
let url = NSURL(string: "https://devimages.apple.com.edgekey.net/assets/elements/icons/128x128/ios-9-white_2x.png")
let data = NSData(contentsOfURL: url!)
UIImage(data: data!)
