import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel = GameBoardViewModel()

    var body: some View {
        VStack(spacing: 4) {
            ForEach(0..<GameBoard.Const.sideLength, id: \.self) { row in
                HStack(spacing: 4) {
                    ForEach(0..<GameBoard.Const.sideLength, id: \.self) { column in
                            Button("") {
                                self.viewModel.didSelect(at: row, column: column)
                            }
                            .frame(width: 44, height: 44, alignment: .center)
                            .background(self.viewModel.stone(for: row, column: column).color)
                            .cornerRadius(44 / 2)
                    }
                    .background(Color.blue.opacity(0.3))
                }
            }
        }
    }
}

private extension Stone {
    var color: Color? {
        switch self {
        case .black:
            return .black

        case .white:
            return .white

        case .empty:
            return nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
