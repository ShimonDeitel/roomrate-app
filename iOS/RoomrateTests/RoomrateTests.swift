import XCTest
@testable import Roomrate

@MainActor
final class RoomrateTests: XCTestCase {
    var store: Store!

    override func setUp() {
        super.setUp()
        store = Store()
    }

    func testSeedDataBelowFreeLimit() {
        XCTAssertLessThan(store.entries.count, Store.freeLimit)
    }

    func testAddEntryIncreasesCount() {
        let before = store.entries.count
        store.add(Entry(hotelName: "Test", roomNumber: "Test2", comfort: 1, noise: 2))
        XCTAssertEqual(store.entries.count, before + 1)
    }

    func testCanAddMoreWhenBelowLimit() {
        XCTAssertTrue(store.canAddMore)
    }

    func testCannotAddMoreAtLimit() {
        while store.entries.count < Store.freeLimit {
            store.add(Entry(hotelName: "X", roomNumber: "Y", comfort: 1, noise: 1))
        }
        XCTAssertFalse(store.canAddMore)
    }

    func testDeleteEntryRemovesIt() {
        let entry = Entry(hotelName: "Del", roomNumber: "Me", comfort: 1, noise: 1)
        store.add(entry)
        store.delete(entry)
        XCTAssertFalse(store.entries.contains(where: { $0.id == entry.id }))
    }

    func testUpdateEntryChangesFields() {
        var entry = Entry(hotelName: "Old", roomNumber: "Old2", comfort: 1, noise: 1)
        store.add(entry)
        entry.hotelName = "New"
        store.update(entry)
        XCTAssertEqual(store.entries.first(where: { $0.id == entry.id })?.hotelName, "New")
    }

    func testDeleteAtOffsets() {
        store.add(Entry(hotelName: "A", roomNumber: "B", comfort: 1, noise: 1))
        let before = store.entries.count
        store.delete(at: IndexSet(integer: 0))
        XCTAssertEqual(store.entries.count, before - 1)
    }
}
