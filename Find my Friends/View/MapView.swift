//
//  MapView.swift
//  Find my Friends
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
    @EnvironmentObject var authentication: Authentication
    
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                MKMapViewRepresentable(userTrackingMode: $userTrackingMode)
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
                
                Spacer()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Ausloggen") {
                                authentication.updateValidation(success: true)
                            }
                        }
                    }
                    .navigationTitle("Find my Friends")
                    .navigationBarTitleDisplayMode(.inline)
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
