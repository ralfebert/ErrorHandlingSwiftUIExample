import SwiftUI

struct AlertExampleView: View {
    @State var showAlert: Bool = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                self.showAlert = true
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text("I just called to say I am an alert"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}
