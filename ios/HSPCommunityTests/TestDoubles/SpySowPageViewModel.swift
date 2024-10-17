@testable import HSPCommunity
import SwiftUI

class SpySowSeedPageViewModel: SowSeedPageViewModel {
    var container: DIContainer = DIContainer.makeTestDouble()
    
    var input: String = ""
    var selectedTab: Binding<AppTab> = .constant(AppTab.sowSeed)
    
    var sowSeed_wasCalled = false
    func sowSeed() {
        sowSeed_wasCalled = true
    }
}
