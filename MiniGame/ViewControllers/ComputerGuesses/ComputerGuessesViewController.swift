import Foundation
import UIKit

class ComputerGuessesViewController: UIViewController {
    @IBOutlet
    private weak var numberTryLabel: UILabel!
    @IBOutlet
    private weak var isNumberLable: UILabel!
    
    private var viewModel: ComputerGuessesViewController.ViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
        updateUI()
    }
    
    func updateUI() {
        numberTryLabel.text = "Try № \(viewModel.getNumberTry())"
        isNumberLable.text = "Your number is - \(viewModel.getCurrentNumber())?"
    }
    
    @IBAction func higherNumberButtonTap(_ sender: UIButton) {
        viewModel.higherTap()
    }
    
    @IBAction func equalButtonTap(_ sender: UIButton) {
        viewModel.equalsTap()
    }
    
    @IBAction func lessNumberButtonTap(_ sender: UIButton) {
        viewModel.lessTap()
    }
}

