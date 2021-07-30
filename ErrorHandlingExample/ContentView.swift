import SwiftUI

enum ExampleError: LocalizedError {
    case validationFailed

    var errorDescription: String? {
        switch self {
        case .validationFailed:
            return "Something is wrong here."
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var errorHandling: ErrorHandling

    var body: some View {
        VStack(spacing: 10) {
            Button("Validate") {
                do {
                    try self.validate()
                } catch {
                    self.errorHandling.handle(error: error)
                }
            }

            TryButton("Validate") {
                try self.validate()
            }

            AlertExampleView()
        }
    }

    func validate() throws {
        throw ExampleError.validationFailed
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
