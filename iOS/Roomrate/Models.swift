import Foundation

struct Entry: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var hotelName: String
    var roomNumber: String
    var comfort: Double
    var noise: Double
    var date: Date = Date()
    var notes: String = ""
}
