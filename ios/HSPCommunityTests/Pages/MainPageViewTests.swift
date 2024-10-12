import XCTest
import SwiftUI
import Nimble
import ViewInspector
@testable import HSPCommunity

class SpyStubMainPageViewModel: MainPageViewModel {
    func getSeeds() -> [HSPCommunity.Seed] {
        return []
    }
    
    func postSeeds(text: String) {}
    
    var seeds: [HSPCommunity.Seed] = []
}

final class MainPageViewTests: XCTestCase {
    func test_コンポーネントが正しく表示される() throws {
        let viewModel = SpyStubMainPageViewModel()
        viewModel.seeds = [
            Seed(
                id: UUID(),
                username: "name",
                text: "教えてください",
                favorite: 1,
                comment: 4,
                tag: .help
            )
        ]
        
        let view = MainPageView(viewModel: viewModel)
        ViewHosting.host(view: view)
        
        expect{ try view.inspect().find(text: "安らぎの庭") }.toNot(beNil())
        expect{ try view.inspect().find(text: "教えてください") }.toNot(beNil())
        expect{ try view.inspect().text().string()}.toNot(beNil())
        expect{ try view.inspect().find(text: "help") }.toNot(beNil())
    }
}
