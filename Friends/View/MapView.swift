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
            .sheet(isPresented: .constant(true)) {
                VStack(spacing: 15) {
                    TextField("Suche Freunde" , text:
                            .constant(""))
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.ultraThickMaterial)
                    }
                    
                }
                .padding()
                .padding(.top)
                
            }
        }
    }
    
    @ViewBuilder
    func FriendList() -> some View {
        VStack(spacing: 25) {
            HStack(spacing: 12) {
                
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
