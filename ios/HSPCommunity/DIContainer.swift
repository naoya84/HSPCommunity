import Foundation

struct DIContainer {
    let seedRepository: SeedRepository
    
    static func make() -> DIContainer {
        let fetchSeedData: FetchSeedData = FetchSeedData()
        let seedRepository = SeedRepositoryImpl(fetchSeed: fetchSeedData)
        
        return DIContainer(
            seedRepository: seedRepository
        )
    }
}
