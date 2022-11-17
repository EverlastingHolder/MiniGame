import Foundation
import UIKit

extension GuessViewController {
    class ViewModel {
        weak var viewController: GuessViewController?
        
        private var model: GuessModel = .init()
        
        func getIsEnable() -> Bool {
            model.isEnable
        }
        
        func setIsEnable(_ isEnable: Bool) {
            model.isEnable = isEnable
        }
        
        func displayViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nc = storyboard.instantiateViewController(
                withIdentifier: String(describing: ComputerGuessesViewController.self))
            viewController?.present(nc, animated: true)
        }
    }
}
