import Foundation

//:# დავალება.
/*: * callout(მოცემულია enum - ი):
 ** შეასრულე ქვემოთ მეცემული დავალებები აუცილებელია არ გამოიყენო ციკლები.
*/

enum Corner: CaseIterable {
case left
case right
case top
case bottom
case topLeft
case topRight
case bottomLeft
case bottomRight
case middle
}

var corners = (1...10).compactMap { _ in Corner.allCases.randomElement() }


//:# არ გამოიყენო ციკლები.



//:*  corners მასივი გარდაქმენი ახალი სტრინგების მასივად.

let cornersTexts = corners.map { "\($0)" }

cornersTexts

//:*  გაიგე არის თუ არა ყველა ელემენტი top ან middle ან bottom.

corners.allSatisfy {
    [.bottom, .middle, .top].contains($0)
}


//:*  გაიგე შეიცავს თუ არა corners-ი მინიმუმ ორ left-ს.

corners.filter { $0 == .left }.count > 1

//:*  გაიგე corners-ში არსებული უნიკალური ელემენტების რაოდენობა.

Set(corners).count

//:*  გაიგე მასივის პირველ ნახევარში უფრო მეტი right არის თუ მეორე ნახევარში.



let halfCount = corners.count / 2

let leftCorners = corners.dropLast(halfCount)
let rightCorners = corners.dropFirst(halfCount)

//let leftCorners = corners.prefix(halfCount)
//let rightCorners = corners.suffix(halfCount)

leftCorners.filter { $0 == .right }.count > rightCorners.filter { $0 == .right }.count

var leftCornersCount = 0
var rightCornersCount = 0

for (index, item) in corners.enumerated() {
    if index < halfCount {
        leftCornersCount += (item == .right ? 1 : 0)
    } else {
        rightCornersCount += (item == .right ? 1 : 0)
    }
}

corners.enumerated().forEach { index, item in
   
    if index < halfCount {
        leftCornersCount += (item == .right ? 1 : 0)
    } else {
        rightCornersCount += (item == .right ? 1 : 0)
    }
}



//:*  წაშალე ყველა ელემენტი, რომელიც არ არის bottomRight.

corners.removeAll { item -> Bool in
    item != .bottomRight
}

//:*  დაბეჭდე ელემენტები მანამ სანამ არ შეგვხვდება bottom.


let whileBottomArray = corners.prefix { (item) -> Bool in
    item != .bottom
}

whileBottomArray
corners

//:*  გამოტოვე ელემენტები მანამ სანამ არ შეგვხვდება bottomRight და დაბეჭდეთ დანარჩენი.

let whilebottomRightArray = corners.drop { (item) -> Bool in
    item != .bottomRight
}

whilebottomRightArray
corners

//:*  გაიგე ყველა bottom ელემენტის ინდექსი.

let result = corners
    .enumerated()
    .filter { $0.element == .bottom }
    .map { $0.offset }

result


