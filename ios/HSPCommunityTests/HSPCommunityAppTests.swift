import XCTest
import SwiftUI
import Nimble
import ViewInspector
@testable import HSPCommunity

final class HSPCommunityAppTests: XCTestCase {
    func test_タブをクリックすると適切なページに遷移する() throws {
        let selectedTab: Binding<AppTab> = .init(wrappedValue: .main)
        let view = ContentView(selectedTab: selectedTab)

        view.selectedTab = .sowSeed
        expect(selectedTab.wrappedValue).to(equal(.sowSeed))
        
        view.selectedTab = .spunSeed
        expect(selectedTab.wrappedValue).to(equal(.spunSeed))
        
        view.selectedTab = .main
        expect(selectedTab.wrappedValue).to(equal(.main))
    }
}
