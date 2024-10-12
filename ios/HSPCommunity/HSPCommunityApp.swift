import SwiftUI

@main
struct HSPCommunityApp: App {
    @State private var selectedTab: AppTab = .main

    var body: some Scene {
        WindowGroup {
            ContentView(selectedTab: $selectedTab)
        }
    }
}

struct ContentView: View {
    @Binding var selectedTab: AppTab
    let container = DIContainer.make()
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                MainPageView(
                    viewModel: MainPageViewModelImpl(container: container)
                )
                    .tag(AppTab.main)
                    .tabItem({Image(systemName: "camera.macro")})
                
                SowSeedPageView(
                    viewModel: SowSeedPageViewModelImpl.init(
                        selectedTab: $selectedTab,
                        container: container
                    )
                )
                    .tag(AppTab.sowSeed)
                    .tabItem({Image(systemName: "square.and.pencil")})
                
                SpunSeedPageView()
                    .tag(AppTab.spunSeed)
                    .tabItem({Image(systemName: "heart.fill")})
            }
        }
    }
}

enum AppTab {
    case main
    case sowSeed
    case spunSeed
}

#Preview {
    var selectedTab: Binding<AppTab> = .constant(AppTab.main)
    return ContentView(selectedTab: selectedTab)
}
