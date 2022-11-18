import Foundation

struct ComputerGuessesModel {
    var lowerRange: Int = 1
    var upperRange: Int = 101
    var currentNumber: Int = 50
    var numberTry: Int = 1
    
    mutating func defaultValue() {
        numberTry = 1
        lowerRange = 1
        upperRange = 101
        currentNumber = 50
    }
}
