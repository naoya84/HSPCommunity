import Foundation
import SwiftUI

protocol MainPageViewModel: ObservableObject {
    var container: DIContainer { get }
    var seeds: [Seed] { get set }
    func getSeeds() async throws
}

class MainPageViewModelImpl: MainPageViewModel {
    let container: DIContainer
    @Published var seeds: [Seed] = []
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func getSeeds() async throws {
        let seeds = try await container.seedRepository.getSeeds()
        DispatchQueue.main.async {
            self.seeds = seeds
        }
    }
}

