import Foundation
@testable import HSPCommunity

class DummySeedRepository: SeedRepository {
    var fetchSeed: FetchSeed
    
    init(fetchSeed: FetchSeed) {
        self.fetchSeed = fetchSeed
    }
    
    func getSeeds() async throws -> [Seed] {
        return []
    }
    
    func postSeed(text: String) async throws {}
    
    func addFavorite(seedId: Int) async throws -> [Seed] {
        return []
    }
}

class SpySeedRepository: SeedRepository {
    var fetchSeed: FetchSeed
    
    init(fetchSeed: FetchSeed) {
        self.fetchSeed = fetchSeed
    }
    
    var getSeeds_wasCalled = false
    func getSeeds() async throws -> [Seed] {
        getSeeds_wasCalled = true
        return []
    }
    
    var postSeed_wasCalled = false
    func postSeed(text: String) async throws {
        postSeed_wasCalled = true
    }
    
    var addFavorite_arg: Int = 0
    var addFavorite_returnValue: [Seed] = []
    func addFavorite(seedId: Int) async throws -> [Seed] {
        addFavorite_arg = seedId
        return addFavorite_returnValue
    }
}
