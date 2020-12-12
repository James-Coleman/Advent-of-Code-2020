import Cocoa

var str = "Hello, playground"

struct Bag {
    struct Contents {
        let count: Int
        let bag: Bag
    }
    
    enum Error: Swift.Error {
        case wrongHalfCount(Int)
        case wrongComponentCount(Int)
        case countNotInt(String)
    }
    
    let tone: String
    let colour: String
    var contents: [Contents]
    
    init(input: String) throws {
        let split = input.components(separatedBy: " contain ")
        guard split.count == 2 else { throw Error.wrongHalfCount(split.count) }
        
        let firstHalf = split[0]
        
        let components = firstHalf.components(separatedBy: " ")
        guard components.count == 3 else { throw Error.wrongComponentCount(components.count) }
        
        self.tone = components[0]
        self.colour = components[1]
        
        let secondHalf = split[1]
        
        if secondHalf == "no other bags." {
            self.contents = []
        } else {
            let contentInput = secondHalf.components(separatedBy: ", ")
            
            let contents = try contentInput.map { string -> Contents in
                let contentsComponents = string.split(separator: " ").map { String($0) }
                guard contentsComponents.count == 4 else { throw Error.wrongComponentCount(contentsComponents.count) }
                
                let bag = Bag(tone: contentsComponents[1], colour: contentsComponents[2])
                
                guard let count = Int(contentsComponents[0]) else { throw Error.countNotInt(contentsComponents[0]) }
                
                let contents = Contents(count: count, bag: bag)
                
                return contents
            }
            
            self.contents = contents
        }
    }
    
    /// Convenience for nested bag
    init(tone: String, colour: String) {
        self.tone = tone
        self.colour = colour
        self.contents = []
    }
}

do {
    let bag = try Bag(input: "light red bags contain 1 bright white bag, 2 muted yellow bags.")
//    print(bag)
} catch {
    error
}

// Loop through list first, creating array of bags.
// Then parse together? But would still need to know what children go into what parents.
// Might need classes instead of structs.

let exampleInput = """
light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
"""

let exampleArray = exampleInput.split(separator: "\n").map { String($0) }

do {
    let exampleBags = try exampleArray.map { try Bag(input: $0) }
} catch {
    error
}
