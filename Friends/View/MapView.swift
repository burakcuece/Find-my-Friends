//
//  MapView.swift
//  Friends
//
//  Created by Burak Cüce on 23.05.22.
//

import SwiftUI
import CoreLocation.CLLocation
import MapKit.MKAnnotationView
import MapKit.MKUserLocation


struct MapView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @State private var userTrackingMode: MKUserTrackingMode = .none
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        
        
        ZStack {
            
            MKMapViewRepresentable(userTrackingMode: $userTrackingMode)
                .ignoresSafeArea(.all)
                .environmentObject(MapViewContainer())
            VStack {
                
                if !(userTrackingMode == .follow || userTrackingMode == .followWithHeading) {
                    
                    HStack {
                        
                        Spacer()
                        Button(action: { self.followUser() }) {
                            Image(systemName: "location.fill")
                                .modifier(MapButton(backgroundColor: .primary))
                        }
                        .padding(.trailing)
                    }
                    .padding(.top)
                }
            }
            
        }
    }

    private func followUser() {
        userTrackingMode = .follow
    }
    
}

fileprivate struct MapButton: ViewModifier {
    
    let backgroundColor: Color
    var fontColor: Color = Color(UIColor.systemBackground)
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(self.backgroundColor.opacity(0.9))
            .foregroundColor(self.fontColor)
            .font(.title)
            .clipShape(Circle())
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
