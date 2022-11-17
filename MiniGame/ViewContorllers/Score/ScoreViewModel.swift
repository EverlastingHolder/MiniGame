import Foundation

extension ScoreViewController {
    class ViewModel {
        private var model: ScoreModel = .init()
        
        func getHumanTry() -> String {
            ScoreModel.humanTry.description
        }
        
        func getComputerTry() -> String {
            ScoreModel.computerTry.description
        }
    }
}
