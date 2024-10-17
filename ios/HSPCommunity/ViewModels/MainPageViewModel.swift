import Foundation
import SwiftUI

protocol MainPageViewModel: ObservableObject {
    var container: DIContainer { get }
    var seeds: [Seed] { get set }
    func getSeeds() async throws
    func addFavorite(seedId: Int) async throws
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
    
    func addFavorite(seedId: Int) async throws {
        let seeds = try await container.seedRepository.addFavorite(seedId: seedId)
        DispatchQueue.main.async {
            self.seeds = seeds
        }
    }
}

