import Foundation

protocol SeedRepository {
    var fetchSeed: FetchSeed { get }
    func getSeeds() async throws -> [Seed]
    func postSeed(text: String) async throws
    func addFavorite(seedId: Int) async throws -> [Seed]
}

class SeedRepositoryImpl: SeedRepository {
    let fetchSeed: FetchSeed
    
    init(fetchSeed: FetchSeed) {
        self.fetchSeed = fetchSeed
    }
    
    func getSeeds() async throws -> [Seed] {
        return try await fetchSeed.getSeeds()
    }
    
    func postSeed(text: String) async throws {
        try await fetchSeed.postSeed(text: text)
    }
    
    func addFavorite(seedId: Int) async throws -> [Seed] {
        return try await fetchSeed.addFavorite(seedId: seedId)
    }
}




