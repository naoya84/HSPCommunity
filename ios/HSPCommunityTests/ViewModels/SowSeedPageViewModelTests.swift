import XCTest
import SwiftUI
import Nimble
import ViewInspector
@testable import HSPCommunity

final class SowSeedPageViewModelTests: XCTestCase {
    func test_sowSeedメソッドが呼ばれるとSeedRepositoryのpostSeedを呼ぶ() async throws {
        let spyRepository = SpySeedRepository(fetchSeed: SpyFetchSeed())
        let viewModel = SowSeedPageViewModelImpl(
            selectedTab: Binding.constant(AppTab.sowSeed),
            container: DIContainer(seedRepository: spyRepository)
        )
        
        try await viewModel.sowSeed()

        expect(spyRepository.postSeed_wasCalled).to(beTrue())
    }
    
    func test_sowSeedメソッドが呼ばれるとAppTabにmainがセットされる() async throws {
        var selectedTab: Binding<AppTab> = .init(wrappedValue: AppTab.sowSeed)
        let dummyRepository = SpySeedRepository(fetchSeed: SpyFetchSeed())
        
        let viewModel = SowSeedPageViewModelImpl(
            selectedTab: selectedTab,
            container: DIContainer(seedRepository: dummyRepository)
        )

        try await viewModel.sowSeed()
        
        expect(viewModel.selectedTab.wrappedValue).to(equal(AppTab.main))
    }
}
