import Foundation
import SwiftUI

protocol SowSeedPageViewModel: ObservableObject {
    var container: DIContainer { get }
    var input: String { get set }
    var selectedTab: Binding<AppTab> { get set }
    func sowSeed() async throws
}

class SowSeedPageViewModelImpl: SowSeedPageViewModel {
    @Published var input: String = ""
    var container: DIContainer
    var selectedTab: Binding<AppTab>
    
    init(selectedTab: Binding<AppTab>, container: DIContainer) {
        self.selectedTab = selectedTab
        self.container = container
    }
    
    func sowSeed() async throws{
        try await container.seedRepository.postSeeds(text: input)
        selectedTab.wrappedValue = AppTab.main
    }
}
