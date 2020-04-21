import SwiftUI

struct GameBoardView: View {
    @ObservedObject var viewModel = GameBoardViewModel()

    var body: some View {
        VStack {
            ForEach(0..<8, id: \.self) { row in
                HStack {
                    ForEach(0..<8, id: \.self) { column in
                        Button("X") {
                            self.viewModel.didSelect(at: row, column: column)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView()
    }
}
