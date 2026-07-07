import SwiftUI

enum Theme {
    static let accent = Color(red: 0.290, green: 0.369, blue: 0.667)
    static let background = Color(red: 0.039, green: 0.047, blue: 0.094)
    static let card = background.opacity(0.6)
    static let titleFont = Font.system(.largeTitle, design: .rounded).weight(.bold)
    static let headlineFont = Font.system(.headline, design: .rounded)
    static let bodyFont = Font.system(.body, design: .rounded)
}
