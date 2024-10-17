@testable import HSPCommunity

class SpyStubMainPageViewModel: MainPageViewModel {
    var container: DIContainer = .makeTestDouble()
    var seeds: [Seed] = []
    
    func getSeeds() async throws {}
    
    var addFavorite_arg: Int = 0
    func addFavorite(seedId: Int) {
        addFavorite_arg = seedId
    }
}
