import Foundation

struct HumanGuessesModel {
    let hiddenNumber: Int = (1...100).randomElement()!
    var numderTry: Int = 1
}
