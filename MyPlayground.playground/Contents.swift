import UIKit
import PlaygroundSupport
import Darwin

//extension Collection where Element: Equatable {
//    func allEqual() -> Bool {
//        for element in self {
//            if element != self.first {
//                return false
//            }
//        }
//        return true
//    }
//}
//
//let equalNumbers = [100, 100, 100, 100, 100]
//let differentNumbers = [100, 100, 200, 100, 200]

//print(equalNumbers.allEqual())
//print(differentNumbers.allEqual())

protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

//@objc protocol CounterDataSource {
//    @objc optional func increment(forCount count: Int) -> Int
//    @objc optional var fixedIncrement: Int { get }
//}

//class Counter {
//    var count = 0
//    var dataSource: CounterDataSource?
//    func increment() {
//        if let amount = dataSource?.increment?(forCount: count) {
//            count += amount
//        } else if let amount = dataSource?.fixedIncrement {
//            count += amount
//        }
//    }
//}

//class ThreeSource: NSObject, CounterDataSource {
//    let fixedIncrement = 3
//}

//class TowardsZeroSource: NSObject, CounterDataSource {
//    func increment(forCount count: Int) -> Int {
//        if count == 0 {
//            return 0
//        } else if count < 0 {
//            return 1
//        } else {
//            return -1
//        }
//    }
//}

//var counter = Counter()
//
//counter.count = -4
//counter.dataSource = TowardsZeroSource()

//for _ in 1...5 {
//    counter.increment()
//    print(counter.count)
//}

//counter.dataSource = ThreeSource()
//for _ in 1...4 {
//    counter.increment()
//    print(counter.count)
//}

//protocol Named {
//    var name: String { get }
//}
//protocol Aged {
//    var age: Int { get }
//}
//struct Person2: Named, Aged {
//    var name: String
//    var age: Int
//}

//func wishHappyBirthday(to celebrator: Named & Aged) {
//    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
//}
//
//let birthdayPerson = Person2(name: "Malcolm", age: 21)
//wishHappyBirthday(to: birthdayPerson)
//
//class Location {
//    var latitude: Double
//    var longitude: Double
//    init(latitude: Double, longitude: Double) {
//        self.latitude = latitude
//        self.longitude = longitude
//    }
//}

//class City: Location, Named {
//    var name: String
//    init(name: String, latitude: Double, longitude: Double) {
//        self.name = name
//        super.init(latitude: latitude, longitude: longitude)
//    }
//}
//
//func beginConcert(in location: Location & Named) {
//    print("Hello, \(location.name) \(location.latitude)!")
//}
//
//let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
//beginConcert(in: seattle)
//
//protocol TextRepresentable {
//    var textualDescription: String { get }
//}
//
//protocol Togglable {
//    mutating func toggle()
//}

//enum OnOffSwitch: Togglable {
//    case off, on
//    mutating func toggle() {
//        switch self {
//        case .off: self = .on
//        case .on: self = .off
//        }
//    }
//}
//var lightSwitch = OnOffSwitch.off
//lightSwitch.toggle()
//lightSwitch.toggle()

//protocol SomeProtocol {
//    static func someTypeMethod()
//    init(someParameter: Int)
//}

//class SomeClass2: SomeProtocol {
//    static func someTypeMethod() {
//
//    }
//
//    required init(someParameter: Int) {
//        // initializer implementation goes here
//    }
//}
//
//class SomeSubClass: SomeClass2 {
//    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
//    required init(someParameter: Int) {
//        fatalError("init(someParameter:) has not been implemented")
//    }
//}
//
//let cls2 = SomeClass2.init(someParameter: 4)
//
//protocol RandomNumberGenerator {
//    func random() -> Double
//}
//
//extension RandomNumberGenerator {
//    func randomBool() -> Bool {
//        return random() > 0.5
//    }
//}

//class LinearCongruentialGenerator: RandomNumberGenerator {
//    var lastRandom = 42.0
//    let m = 139968.0
//    let a = 3877.0
//    let c = 29573.0
//    func random() -> Double {
//        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
//        return lastRandom / m
//    }
//}
//let generator = LinearCongruentialGenerator()
//print("Here's a random number: \(generator.random())")
//print("And another one: \(generator.random())")
//print("And here's a random Boolean: \(generator.randomBool())")

//protocol FullyNamed {
//    var fullName: String { get }
//}
//
//protocol FirstProtocol {
//    // protocol definition goes here
//    var mustBeSettable: Int { get set }
//    var doesNotNeedToBeSettable: Int { get }
//}
//
//protocol AnotherProtocol {
//    // protocol definition goes here
//    static var someTypeProperty: Int { get set }
//}
//
//struct SomeStructure: FirstProtocol, AnotherProtocol {
//    var mustBeSettable: Int = 1
//    var doesNotNeedToBeSettable: Int = 2
//    static var someTypeProperty: Int = 3
//}
//
//struct Person: FullyNamed {
//    var fullName: String
//}
//let john = Person(fullName: "John Appleseed")
//
//
//class Starship: FullyNamed {
//    var prefix: String?
//    var name: String
//    init(name: String, prefix: String? = nil) {
//        self.name = name
//        self.prefix = prefix
//    }
//    var fullName: String {
//        return (prefix != nil ? prefix! + " " : "") + name
//    }
//}
//
//var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
//print(ncc1701.fullName)
//
//class SomeClass: NSObject, FirstProtocol, AnotherProtocol {
//    var mustBeSettable: Int = 1
//    var doesNotNeedToBeSettable: Int = 2
//    static var someTypeProperty: Int = 3
//}
//
//protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
//    // protocol definition goes here
//}
//
//class Dice {
//    let sides: Int
//    let generator: RandomNumberGenerator
//    init(sides: Int, generator: RandomNumberGenerator) {
//        self.sides = sides
//        self.generator = generator
//    }
//    func roll() -> Int {
//        return Int(generator.random() * Double(sides)) + 1
//    }
//}
//
//extension Dice: TextRepresentable {
//    var textualDescription: String {
//        return "A \(sides)-sided dice"
//    }
//}
//
//let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
//print(d12.textualDescription)
//
//var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
//for _ in 1...5 {
//    print("Random dice roll is \(d6.roll())")
//}
//
//protocol DiceGame {
//    var dice: Dice { get }
//    func play()
//}
//
//protocol DiceGameDelegate: AnyObject {
//    func gameDidStart(_ game: DiceGame)
//    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
//    func gameDidEnd(_ game: DiceGame)
//}
//
//class SnakesAndLadders: DiceGame {
//    let finalSquare = 25
//    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
//    var square = 0
//    var board: [Int]
//    init() {
//        board = Array(repeating: 0, count: finalSquare + 1)
//        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//    }
//    weak var delegate: DiceGameDelegate?
//    func play() {
//        square = 0
//        delegate?.gameDidStart(self)
//        gameLoop: while square != finalSquare {
//            let diceRoll = dice.roll()
//            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
//            switch square + diceRoll {
//            case finalSquare:
//                break gameLoop
//            case let newSquare where newSquare > finalSquare:
//                continue gameLoop
//            default:
//                square += diceRoll
//                square += board[square]
//            }
//        }
//        delegate?.gameDidEnd(self)
//    }
//}
//
//extension SnakesAndLadders: TextRepresentable {
//    var textualDescription: String {
//        return "A game of Snakes and Ladders with \(finalSquare) squares"
//    }
//}
//
//protocol PrettyTextRepresentable: TextRepresentable {
//    var prettyTextualDescription: String { get }
//}
//
//extension PrettyTextRepresentable  {
//    var prettyTextualDescription: String {
//        return textualDescription
//    }
//}

//extension SnakesAndLadders: PrettyTextRepresentable {
//    var prettyTextualDescription: String {
//        var output = textualDescription + ":\n"
//        for index in 1...finalSquare {
//            switch board[index] {
//            case let ladder where ladder > 0:
//                output += "▲ "
//            case let snake where snake < 0:
//                output += "▼ "
//            default:
//                output += "○ "
//            }
//        }
//        return output
//    }
//}
//
//class DiceGameTracker: DiceGameDelegate {
//    var numberOfTurns = 0
//    func gameDidStart(_ game: DiceGame) {
//        numberOfTurns = 0
//        if game is SnakesAndLadders {
//            print("Started a new game of Snakes and Ladders")
//        }
//        print("The game is using a \(game.dice.sides)-sided dice")
//    }
//    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
//        numberOfTurns += 1
//        print("Rolled a \(diceRoll)")
//    }
//    func gameDidEnd(_ game: DiceGame) {
//        print("The game lasted for \(numberOfTurns) turns")
//    }
//}
//
//let tracker = DiceGameTracker()
//let game = SnakesAndLadders()
//game.delegate = tracker
//print(game.textualDescription)
//print(game.prettyTextualDescription)
//game.play()
//
//extension Array: TextRepresentable where Element: TextRepresentable {
//    var textualDescription: String {
//        let itemsAsText = self.map { $0.textualDescription }
//        return "[" + itemsAsText.joined(separator: ", ") + "]"
//    }
//}
//
//let myDice = [d6, d12]
//print(myDice.textualDescription)
//
//struct Hamster {
//    var name: String
//    var textualDescription: String {
//        return "A hamster named \(name)"
//    }
//}
//extension Hamster: TextRepresentable {}
//
//let simonTheHamster = Hamster(name: "Simon")
//let somethingTextRepresentable: TextRepresentable = simonTheHamster
//print(somethingTextRepresentable.textualDescription)
//print(simonTheHamster.textualDescription)
//
//let things: [TextRepresentable] = [game, d12, simonTheHamster]
//for thing in things {
//    print(thing.textualDescription)
//}

//protocol Meh {
//    func doSomething();
//}

//Extend protocol Meh, where `Self` is of type `UIViewController`
//func blah() will only exist for classes that inherit `UIViewController`.
//In fact, this entire extension only exists for `UIViewController` subclasses.

//extension Meh where Self: UIViewController {
//    func blah() {
//        print("Blah");
//    }
//
//    func foo() {
//        print("Foo");
//    }
//}
//
//class Foo : UIViewController, Meh { //This compiles and since Foo is a `UIViewController` subclass, it has access to all of `Meh` extension functions and `Meh` itself. IE: `doSomething, blah, foo`.
//    func doSomething() {
//        print("Do Something");
//    }
//}

//let foo = Foo()
//foo.doSomething()
//foo.blah()
//foo.foo()

//class Obj : NSObject, Meh { //While this compiles, it won't have access to any of `Meh` extension functions. It only has access to `Meh.doSomething()`.
//    func doSomething() {
//        print("Do Something");
//    }
//}

//let obj = Obj()
//obj.doSomething()
//obj.blah()
//obj.foo()
//func random(from range: Range<Int>) -> Int {
//    let distance = range.upperBound - range.lowerBound
//    let rnd = arc4random_uniform(UInt32(distance))
//    return range.lowerBound + Int(rnd)
//}
//
//func random(from range: ClosedRange<Int>) -> Int {
//    return random(from: range.lowerBound ..< range.upperBound+1)
//}
//
//let random1 = random(from: 1..<10)
//print(random1)
//let random2 = random(from: 1...9)
//
//enum ExceptionError:Error{
//    case httpCode(Int)
//}
//func throwError() throws {
//    throw ExceptionError.httpCode(500)
//}
//do{
//    try throwError()
//}catch ExceptionError.httpCode(let httpCode) where httpCode >= 500{
//    print("server error")
//}

//let arrayOne = [1,2,3,4,5]
//let dictionary = [1:"hehe1",2:"hehe2",nil:"qw"]
//for i in arrayOne where dictionary[i] != nil {
//    print(dictionary[i])
//}
//
//func genericFunction<S>(str:S) where S:ExpressibleByStringLiteral{
//    print(str)
//}
//// 也可以不使用where语句，直接在尖括号中定义时做限制
//func genericFunction2<S:ExpressibleByStringLiteral>(str:S){
//    print(str)
//}
//
//genericFunction(str: "123")
//
//protocol aProtocol{}
//extension aProtocol where Self:UIView{
//    //只给遵守myProtocol协议的UIView添加了扩展
//    func getString() -> String{
//        return "string"
//    }
//}

//var value:(Int,String) = (100,"小明")
//switch value {
//case let (x,_) where x < 60:
//    print("不及格")
//case let (x,_) where x > 90:
//    print("完美")
//default:
//    print("及格")
//}

//typealias FetchLinksClosure = ([NSString]) -> Void
//
//protocol FetchLinks{
//    func fetchLinks(completion : FetchLinksClosure) -> Void
//}
//
//class Obserber : FetchLinks{
//    func fetchLinks(completion: ([NSString]) -> Void) {
//        let strs = ["this", "is" , "a", "magic", "test"]
//        completion(strs as [NSString])
//    }
//
//    var name:String?
//    {
//        willSet{
//            print("Will set an new value \(newValue) to name，current name is \(name)")
//        }
//        didSet{
//            print("name changed from \(oldValue) to \(name)")
//        }
//    }
//    var count:Int = 0
//    {
//        willSet{
//            print("Will set an new value \(newValue) to count，current count is \(count)")
//        }
//        didSet{
//            print("count changed form \(oldValue) to \(count)")
//        }
//    }
//}
//
//var observer = Obserber()
//observer.count = 1
//observer.name = "ajian"
//observer.fetchLinks { (result) in
//    result.forEach({ (str) in
//        print(str)
//    })
//}
//
//class AnotherClass : FetchLinks{
//    func fetchLinks(completion: ([NSString]) -> Void) {
//        defer { print("game over") }
//        let strs = ["this", "is" , "another", "magic", "test"]
//        completion(strs as [NSString])
//    }
//}
//
//var cls = AnotherClass()
//cls.fetchLinks { (result) in
//    result.forEach({ (str) in
//        print(str)
//    })
//}

//let arr: [String] = ["q", "w", "e", "r",  "t", "y"]
//for (i, item) in arr.enumerated() {
//    print("arr[\(i)] = \(item)")
//}

//var urlComponents = URLComponents(string: "https://itunes.apple.com/search?media=music&entity=song")
//var queryItem = URLQueryItem(name: "term", value: "crowded house")
//let urlForce = urlComponents?.url!
//urlForce?.absoluteString
//urlForce?.scheme
//urlForce?.host
//urlForce?.path
//urlForce?.query
//
//enum Sorting: String {
//    case numberOfStars = "stars"
//    case numberOfForks = "forks"
//    case recency = "updated"
//}
//
//func findRepositories(matching query: String,
//                      sortedBy sorting: Sorting) {
//    var components = URLComponents()
//    components.scheme = "https"
//    components.host = "api.github.com"
//    components.path = "/search/repositories"
//    components.queryItems = [
//        URLQueryItem(name: "q", value: query),
//        URLQueryItem(name: "sort", value: sorting.rawValue)
//    ]
//
//    // Getting a URL from our components is as simple as
//    // accessing the 'url' property.
//    let url = components.url
//    print(url)
//}
//
//findRepositories(matching: "qzj", sortedBy: .numberOfStars)
//
//struct Endpoint {
//    let path: String
//    let queryItems: [URLQueryItem]
//}
//
//extension Endpoint {
//    static func search(matching query: String,
//                       sortedBy sorting: Sorting = .recency) -> Endpoint {
//        return Endpoint(
//            path: "/search/repositories",
//            queryItems: [
//                URLQueryItem(name: "q", value: query),
//                URLQueryItem(name: "sort", value: sorting.rawValue)
//            ]
//        )
//    }
//
//    // We still have to keep 'url' as an optional, since we're
//    // dealing with dynamic components that could be invalid.
//    var url: URL? {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "api.github.com"
//        components.path = path
//        components.queryItems = queryItems
//
//        return components.url
//    }
//}
//
///// An enum representing either a failure with an explanatory error, or a success with a result value.
//public enum Result<T> {
//    case success(T)
//    /// Constructs a success wrapping a `value`.
//    public init(value: T) {
//        self = .success(value)
//    }
//}
//
//class DataLoader {
//    static func request(_ endpoint: Endpoint,
//                 then handler: @escaping (Result<Data>) -> Void) {
//        guard let url = endpoint.url else {
//            let data = Data()
//            return handler(.success(data))
//        }
//
//        let urlSession = URLSession.shared
//        let task = urlSession.dataTask(with: url) {
//            data, _, error in
//            let result = data.map(Result.success)!
//            handler(result)
//        }
//        task.resume()
//    }
//}

//DataLoader.request(.search(matching: "query")) { result in
//    print(result)
//}

//extension URL {
//    init(staticString string: StaticString) {
//        guard let url = URL(string: "\(string)") else {
//            preconditionFailure("Invalid static URL string: \(string)")
//        }
//        self = url
//    }
//}
//let url = URL(staticString: "https://myapp.com/faq.html")
//
//
let view = UIView(frame: CGRect(
    x: 0, y: 0,
    width: 200, height: 500
))

view.backgroundColor = .white
PlaygroundPage.current.liveView = view

let label = UILabel()
label.text = "Let's animate..."
label.sizeToFit()
label.center = view.center
label.alpha = 0
view.addSubview(label)

let button = UIButton(type: .system)
button.setTitle("...multiple views!", for: .normal)
button.sizeToFit()
button.center.x = view.center.x
button.center.y = label.frame.maxY + 50
button.alpha = 0
view.addSubview(button)

//animate([
//    label.animate([
//        .fadeIn(duration: 1),
//        .move(byX: 0, y: -50, duration: 1)
//        ]),
//    button.animate([
//        .fadeIn(duration: 2)
//        ])
//    ])

animate(inParallel:[
    label.animate([
        .fadeIn(duration: 3),
        .move(byX: 0, y: -50, duration: 3)]
    ),
    button.animate(.fadeIn(duration: 3))]
)



//
//enum RawGender {
//    case Male
//    case Female
//}
//
//enum Gender :String{
//    case Male = "hero"
//    case Female = "roly"
//}
//
//let male = Gender.Male
//print(male.rawValue)
//print(RawGender.Male.hashValue)
//
//switch male {
//case Gender.Male: print("Gender is male")
//case Gender.Female: print("Gender is female") // default case is not needed
//}
//
//enum WeekDay :String {
//    case Monday
//    case Tuesday
//    func day() ->String { return self.rawValue }
//}
//
//print(WeekDay.Monday.day()) // prints Monday
//
//enum Student {
//    case Name(String)
//    case Mark(Int,Int,Int)
//    case Other(Any)
//}
//
//var studDetails = Student.Name("Swift")
//var studMarks = Student.Mark(98,97,95)
//var stuAny = Student.Other(["q","z","j"])
//switch stuAny {
//case .Name(let studName):
//    print("Student name is: \(studName).")
//case .Mark(let Mark1, let Mark2, let Mark3):
//    print("Student Marks are: \(Mark1),\(Mark2),\(Mark3).")
//case .Other(let Mark1):
//    print("Student Other are: \(Mark1).")
//default:
//    print("Nothing")
//}
//
//var arr = ["time","to","go","home"]
//arr.forEach { (item) in
//    print(item)
//}
//
//let mapArr = arr.map { (item) in
//    return "curItem:" + "\(item)"
//}
//print(mapArr)
//
//let filterArr = arr.filter { (item) in
//    return item.count>2
//    }.map { (item) in
//    return "curItem:" + "\(item)"
//}
//print(filterArr)

//var filterArr2 = arr.prefix(2)
//print(filterArr2)
//filterArr2 = arr.suffix(1)
////
//var arr2 = ["time","to","go","home"] as Set
//let arr3 = arr2.sorted(by:<)
//print(arr3)
//
//let demoView = RandomColorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//PlaygroundPage.current.liveView = demoView

/**
 Find more information for [Swift](http://swift.org)
*/
//var index = str.index(of: ",")
//var str2 = str[index!...]
//let greeting = str[str.startIndex..<index!]
//let index2 = str.index(index!, offsetBy:2)
//let name = str[index2..<str.endIndex]
//let greeting2 = str.prefix(upTo:index!)
//let greeting3 = str[..<index!]
//let name2 = str.suffix(from:index2)
//let name3 = str[index2...]
