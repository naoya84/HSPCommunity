import XCTest
import SwiftUI
import Nimble
import ViewInspector
@testable import HSPCommunity

final class MainPageViewModelTests: XCTestCase {
    func test_viewModelのgetSeedsを実行するとSeedRepositoryのgetSeedsを呼ぶ() async throws {
        let spySeedRepository = SpySeedRepository(fetchSeed: SpyFetchSeed())
        let viewModel = MainPageViewModelImpl(
            container: DIContainer(seedRepository: spySeedRepository)
        )

        try await viewModel.getSeeds()
        
        expect(spySeedRepository.getSeeds_wasCalled).to(beTrue())
    }
    
    func test_viewModelのaddFavoriteを実行するとSeedRepositoryのaddFavoriteを呼ぶ() async throws {
        let spySeedRepository = SpySeedRepository(fetchSeed: SpyFetchSeed())
        let viewModel = MainPageViewModelImpl(
            container: DIContainer(seedRepository: spySeedRepository)
        )

        try await viewModel.addFavorite(seedId: 1)
        
        expect(spySeedRepository.addFavorite_arg).to(equal(1))
    }
    
    func test_viewModelのaddFavoriteを実行するとSeedRepositoryのaddFavoriteが正しい値を返す() async throws {
        let spySeedRepository = SpySeedRepository(fetchSeed: SpyFetchSeed())
        spySeedRepository.addFavorite_returnValue = [
            Seed(
                id: 1,
                username: "name",
                text: "困っています",
                favorite: 10,
                comment: 3,
                tag: Tag.help
            )
        ]
        let viewModel = MainPageViewModelImpl(container: .makeTestDouble())

        try await viewModel.addFavorite(seedId: 1)
        
        expect(spySeedRepository.addFavorite_returnValue[0].id).to(equal(1))
        expect(spySeedRepository.addFavorite_returnValue[0].username).to(equal("name"))
        expect(spySeedRepository.addFavorite_returnValue[0].text).to(equal("困っています"))
        expect(spySeedRepository.addFavorite_returnValue[0].favorite).to(equal(10))
        expect(spySeedRepository.addFavorite_returnValue[0].tag).to(equal(Tag.help))
    }
}
