/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "Human(name: \(name), age: \(age))"
    }
    
    static func == (lhs: Human, rhs: Human) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age
    }
}

/*:
 Make the `Human` class adopt the `CustomStringConvertible`. Print both of your previously initialized `Human` objects.
 */
let Lily = Human(name: "Lily", age: 17)
let Anna = Human(name: "Anna", age: 18)
print(Lily)
print(Anna)
/*:
 Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
 */
if Lily == Anna {
    print("true")
} else {
    print("false")
}

/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
let Tony = Human(name: "Tony", age: 34)
let Jason = Human(name: "Jason", age: 23)
let Sophia = Human(name: "Sophia", age: 12)


let people = [Lily, Anna, Tony, Jason, Sophia]
let sortedPeople = people.sorted(by: <)
for everyone in sortedPeople{
    print(everyone)
}

/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
 */
import Foundation
let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(Lily),
    let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}


//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
