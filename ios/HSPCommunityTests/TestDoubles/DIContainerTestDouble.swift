import Foundation
@testable import HSPCommunity

extension DIContainer {
    static func makeTestDouble() -> DIContainer {
        let spyFetchSeed: SpyFetchSeed = SpyFetchSeed()
        let spySeedRepository = SpySeedRepository(fetchSeed: spyFetchSeed)
        
        return DIContainer(
            seedRepository: spySeedRepository
        )
    }
}
