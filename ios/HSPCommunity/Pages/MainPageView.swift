import SwiftUI

struct MainPageView<VM: MainPageViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.seeds.sorted(by: {$0.id < $1.id})) { seed in
                    VStack {
                        HStack {
                            Text(seed.username)
                            Spacer()
                            Text(seed.tag.rawValue)
                                .padding(3)
                                .background() {
                                    seed.tag == .help ? Color(.red) : Color(.cyan)
                                }
                        }
                        HStack {
                            Text(seed.text)
                        }
                        HStack {
                            Spacer()
                            HStack {
                                Button {
                                    Task {
                                        do {
                                            try await viewModel.addFavorite(seedId: seed.id)
                                        }
                                    }
                                } label: {
                                    Text("💧")
                                }
                                
                                Text(String(seed.favorite))
                                Text("📝" + String(seed.comment))
                            }
                        }
                    }
                    .padding(.top, 5)
                }
                .listStyle(.inset)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("安らぎの庭")
                            .font(.largeTitle.bold())
                            .accessibilityAddTraits(.isHeader)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
                do {
                    try await viewModel.getSeeds()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    class DummyMainPageViewModel: MainPageViewModel {
        
        var container: DIContainer = .make()
        var seeds: [HSPCommunity.Seed] = []
        func getSeeds() async throws {}
        func addFavorite(seedId: Int) async throws {}
    }
    
    let viewModel = DummyMainPageViewModel()
    
    viewModel.seeds = [
        Seed(
            id: 1,
            username: "繊細さんA",
            text: "〇〇について教えてください",
            favorite: 1,
            comment: 4,
            tag: .help
        )
    ]
    
    return MainPageView(viewModel: viewModel)
}
