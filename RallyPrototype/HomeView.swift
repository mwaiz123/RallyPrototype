import SwiftUI
import MapKit

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Map(initialPosition: .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 43.651070, longitude: -79.389015), distance: 150000)))
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    HomeView()
}
