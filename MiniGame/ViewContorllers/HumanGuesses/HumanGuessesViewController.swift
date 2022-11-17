import UIKit

class HumanGuessesViewController: UIViewController {
    @IBOutlet
    private weak var numberTryLabel: UILabel!
    @IBOutlet
    private weak var guessTextField: UITextField!
    @IBOutlet
    private weak var isNumberLable: UILabel!
    
    private let viewModel: HumanGuessesViewController.ViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
        prepareView()
    }
    
    @IBAction func guessButtonTap(_ sender: UIButton) {
        viewModel.guessesTap(text: guessTextField.text!)
        prepareView()
    }
    
    private func prepareView() {
        isNumberLable.text = viewModel.getTextIsNumber()
        numberTryLabel.text = "Try № \(viewModel.getNumberTry())"
    }
}

extension HumanGuessesViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let updatedText = text.replacingCharacters(in: Range(range, in: text)!, with: string)
        if let intValue = Int(updatedText) {
            return 1 <= intValue && intValue <= 100 ? true : false
        } else {
            return updatedText == "" ? true : false
        }
    }
}
