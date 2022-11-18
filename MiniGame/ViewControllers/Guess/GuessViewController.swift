import UIKit
import Foundation

class GuessViewController: UIViewController {
    @IBOutlet
    private weak var guessNumberTextField: UITextField!
    @IBOutlet
    private weak var enterButton: UIButton!
    
    private var viewModel: GuessViewController.ViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
        prepareView()
    }
    
    private func prepareView() {
        enterButton.isEnabled = viewModel.getIsEnable()
        enterButton.layer.opacity = viewModel.getIsEnable() ? 1 : 0.5
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        viewModel.displayViewController()
    }
}

extension GuessViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let updatedText = text.replacingCharacters(in: Range(range, in: text)!, with: string)
        if let intValue = Int(updatedText) {
            if 1 <= intValue, intValue <= 100 {
                viewModel.setIsEnable(true)
                prepareView()
                return true
            }
            return false
        } else {
            if updatedText == "" {
                viewModel.setIsEnable(false)
                prepareView()
                return true
            }
            return false
        }
    }
}
