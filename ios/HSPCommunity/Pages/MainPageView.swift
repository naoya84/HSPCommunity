import SwiftUI

struct MainPageView<VM: MainPageViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.seeds) { seed in
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
                                Text("💧"+String(seed.favorite))
                                Text("📝"+String(seed.comment))
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
    MainPageView(
        viewModel: MainPageViewModelImpl(
            container: .make()
        )
    )
}
