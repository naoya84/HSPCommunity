import XCTest
import SwiftUI
import Nimble
import ViewInspector
@testable import HSPCommunity

final class SowSeedPageViewModelTests: XCTestCase {
    
    func test_sowSeedメソッドが呼ばれるとRepositoryを呼ぶ() throws {}
    func test_sowSeedメソッドが呼ばれるとAppTabにmainがセットされる() throws {
        var selectedTab: Binding<AppTab> = .init(wrappedValue: AppTab.sowSeed)
        let viewModel = SowSeedPageViewModelImpl(
            selectedTab: selectedTab
        )

        viewModel.sowSeed()
        
        expect(viewModel.selectedTab.wrappedValue).to(equal(AppTab.main))
    }
}
