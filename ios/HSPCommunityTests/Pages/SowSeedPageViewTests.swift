import XCTest
import SwiftUI
import Nimble
import ViewInspector
@testable import HSPCommunity

class SpySowSeedPageViewModel: SowSeedPageViewModel {
    var input: String = ""
    var selectedTab: Binding<HSPCommunity.AppTab> = .constant(AppTab.sowSeed)
    
    var sowSeed_wasCalled = false
    func sowSeed() {
        sowSeed_wasCalled = true
    }
}

final class SowSeedPageViewTests: XCTestCase {
    func test_textEditorとbuttonが正しく表示される() throws {
        let viewModel = SpySowSeedPageViewModel()
        let view = SowSeedPageView(
            viewModel: viewModel
        )
        ViewHosting.host(view: view)
        
        expect{ try view.inspect().find(ViewType.TextEditor.self) }.toNot(beNil() )
        expect{ try view.inspect().find(ViewType.Button.self) }.toNot(beNil() )
    }
    
    func test_タネをまくをクリックした時sowSeedメソッドが正しく呼ばれる() throws {
        let viewModel = SpySowSeedPageViewModel()
        let view = SowSeedPageView(
            viewModel: viewModel
        )
        ViewHosting.host(view: view)
        
        let button = try view.inspect().find(ViewType.Button.self)
        try button.tap()
        expect(viewModel.sowSeed_wasCalled).to(beTrue())
    }
}
