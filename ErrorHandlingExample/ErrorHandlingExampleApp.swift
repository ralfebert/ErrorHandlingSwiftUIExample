import SwiftUI

@main
struct ErrorHandlingExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .withErrorHandling()
        }
    }
}
