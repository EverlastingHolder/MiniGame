import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet
    private weak var yoursTriesLable: UILabel!
    @IBOutlet
    private weak var computerTriesLable: UILabel!
    @IBOutlet
    private weak var isWinLable: UILabel!
    
    private var viewModel: ScoreViewController.ViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    private func prepareView() {
        yoursTriesLable.text = "Your's tries count: " + viewModel.getHumanTry()
        computerTriesLable.text = "Computer's tries: " + viewModel.getComputerTry()
        if viewModel.getComputerTry() == viewModel.getHumanTry() {
            isWinLable.text = "Draw"
        } else {
            if viewModel.getComputerTry() < viewModel.getHumanTry() {
                isWinLable.text = "Computer win"
            } else {
                isWinLable.text = "You win"
            }
        }
    }
}
