import Foundation
import UIKit

extension HumanGuessesViewController {
    class ViewModel {
        private var textIsNumber: String = ""
        private var model: HumanGuessesModel = .init()
        
        weak var viewController: HumanGuessesViewController?
        
        private func showViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nc = storyboard.instantiateViewController(
                withIdentifier: String(describing: ScoreViewController.self))
            ScoreModel.humanTry = model.numderTry
            viewController?.present(nc, animated: true)
        }
        
        func getNumberTry() -> Int {
            model.numderTry
        }
        
        private func increaseNumberTry() {
            model.numderTry += 1
        }
        
        private func setText(text: String) {
            textIsNumber = text
        }
        
        func getTextIsNumber() -> String {
            textIsNumber
        }
        
        func guessesTap(text: String) {
            if let text2 = Int(text) {
                if model.hiddenNumber == text2 {
                showViewController()
                } else {
                    if model.hiddenNumber < text2 {
                        setText(text: "No, my numbers is less then your")
                        increaseNumberTry()
                    } else {
                        setText(text: "No, my numbers is bigger then your")
                        increaseNumberTry()
                    }
                }
            } else {
                setText(text: "You didn't enter a number")
            }
        }
    }
}
