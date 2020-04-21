import SwiftUI

struct GameBoardView: View {
    var body: some View {
        VStack {
            ForEach(1...8, id: \.self) { _ in
                HStack {
                    ForEach(1...8, id: \.self) { _ in
                        Button("X") {}
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
