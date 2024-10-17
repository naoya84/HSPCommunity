import XCTest
import SwiftUI
import Nimble
import ViewInspector
@testable import HSPCommunity

final class MainPageViewTests: XCTestCase {
    func test_コンポーネントが正しく表示される() throws {
        let spyStubviewModel = SpyStubMainPageViewModel()
        spyStubviewModel.seeds = [
            Seed(
                id: 1,
                username: "name",
                text: "教えてください",
                favorite: 1,
                comment: 4,
                tag: .help
            )
        ]
        
        let view = MainPageView(viewModel: spyStubviewModel)
        ViewHosting.host(view: view)
        
        expect{ try view.inspect().find(text: "教えてください") }.toNot(beNil())
        expect{ try view.inspect().find(text: "help") }.toNot(beNil())
        expect{ try view.inspect().find(button: "💧") }.toNot(beNil())
        expect{ try view.inspect().find(text: "📝4") }.toNot(beNil())
    }
        
    func test_seedがありfavoriteButtonをタップするとaddFavoriteが呼ばれる() throws {
        let spyStubViewModel = SpyStubMainPageViewModel()
        spyStubViewModel.seeds = [
            Seed(
                id: 1,
                username: "name",
                text: "教えてください",
                favorite: 1,
                comment: 4,
                tag: .help
            )
        ]
        
        let view = MainPageView(viewModel: spyStubViewModel)
        ViewHosting.host(view: view)
        
        let button = try view.inspect().find(button: "💧")
        try button.tap()
        
        let exp = XCTestExpectation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expect {spyStubViewModel.addFavorite_arg }.to(equal(1))
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
    }
}
