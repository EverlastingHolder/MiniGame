import Foundation
import UIKit

extension ComputerGuessesViewController {
    class ViewModel {
        private var model: ComputerGuessesModel = .init()
        weak var viewController: ComputerGuessesViewController?
        
        func lessTap() {
            model.upperRange = model.currentNumber
            model.currentNumber = (model.upperRange + model.lowerRange) / 2
            isEquals()
            viewController?.updateUI()
        }
        
        func higherTap() {
            model.lowerRange = model.currentNumber
            model.currentNumber = (model.upperRange + model.lowerRange) / 2
            isEquals()
            viewController?.updateUI()
        }
        
        func isEquals() {
            model.upperRange == model.currentNumber
            ||
            model.currentNumber == model.lowerRange ?
            displayAlert()
            :
            increaseNumberTry()
        }
        
        private func displayAlert() {
            let alert = UIAlertController(
                title: "Something went wrong.",
                message: "Maybe you got the button wrong or you didn't stop in time. Shall we try again?",
                preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { _ in
                self.model.defaultValue()
                self.viewController?.updateUI()
            }
            alert.addAction(action)
            viewController?.present(alert, animated: true)
        }
        
        func getNumberTry() -> Int {
            model.numberTry
        }
        
        private func increaseNumberTry() {
            model.numberTry += 1
        }
        
        func getCurrentNumber() -> Int {
            model.currentNumber
        }
        
        func equalsTap() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nc = storyboard.instantiateViewController(
                withIdentifier: String(describing: HumanGuessesViewController.self))
            ScoreModel.computerTry = model.numberTry
            viewController?.present(nc, animated: true)
        }
    }
}
