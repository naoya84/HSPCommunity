import SwiftUI

struct SpunSeedPageView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("SpunSeedPageView")
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("つむいだタネ")
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
}

#Preview {
    SpunSeedPageView()
}
