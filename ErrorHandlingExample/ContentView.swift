import SwiftUI

enum ValidationError: LocalizedError {
    case missingName

    var errorDescription: String? {
        switch self {
        case .missingName:
            return "Something is wrong here."
        }
    }
}

struct Person {
    var name: String = ""

    func validate() throws {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw ValidationError.missingName
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var errorHandling: ErrorHandling
    @State var person = Person()
    @State var showOkAlert = false

    var body: some View {
        Form {
            TextField("Name", text: $person.name)

            // Version with manual do / try / catch
            Button("Submit") {
                do {
                    try person.validate()
                    self.showOkAlert = true
                } catch {
                    self.errorHandling.handle(error: error)
                }
            }

            // Simplified version with TryButton
            TryButton("Submit") {
                try person.validate()
                self.showOkAlert = true
            }
        }
        .alert(isPresented: $showOkAlert) {
            Alert(
                title: Text("Alert"),
                message: Text("Everything is alright"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
