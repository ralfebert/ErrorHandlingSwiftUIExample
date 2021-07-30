import SwiftUI

public struct TryButton<Label>: View where Label: View {
    var action: () throws -> Void
    @ViewBuilder var label: () -> Label
    @EnvironmentObject var errorHandling: ErrorHandling

    public var body: some View {
        Button(
            action: {
                do {
                    try action()
                } catch {
                    self.errorHandling.handle(error: error)
                }
            },
            label: label
        )
    }
}

public extension TryButton where Label == Text {
    init(_ titleKey: LocalizedStringKey, action: @escaping () throws -> Void) {
        self.init(action: action, label: { Text(titleKey) })
    }

    init<S>(_ title: S, action: @escaping () throws -> Void) where S: StringProtocol {
        self.init(action: action, label: { Text(title) })
    }
}
