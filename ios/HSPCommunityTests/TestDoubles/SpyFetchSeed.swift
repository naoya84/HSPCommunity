import Foundation
@testable import HSPCommunity

class SpyFetchSeed: FetchSeed {
    var getSeeds_wasCalled = false
    func getSeeds() async throws -> [Seed] {
        getSeeds_wasCalled = true
        return []
    }
    
    var postSeeds_wasCalled = false
    func postSeed(text: String) async throws {
        postSeeds_wasCalled = true
    }
    
    var addFavorite_wasCalled = false
    func addFavorite(seedId: Int) async throws -> [Seed] {
        addFavorite_wasCalled = true
        return []
    }
}
