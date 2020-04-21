import SwiftUI
import Combine

final class GameBoardViewModel: ObservableObject {
    func didSelect(at row: Int, column: Int) {
        print(row, column)
    }
}
