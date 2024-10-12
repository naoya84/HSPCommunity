import SwiftUI

struct SowSeedPageView<VM: SowSeedPageViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $viewModel.input)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .border(.gray)
                Button {
                    Task {
                        do {
                            try await viewModel.sowSeed()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .overlay(
                            Text("タネをまく")
                                .foregroundStyle(.white)
                                .bold()
                        )
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("タネまき広場")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
}

#Preview {
    let selectedTab = Binding.constant(AppTab.sowSeed)
    
    return SowSeedPageView(
        viewModel: SowSeedPageViewModelImpl.init(
            selectedTab: selectedTab,
            container: DIContainer.make()
        )
    )
}


