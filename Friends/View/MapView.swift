//
//  MapView.swift
//  Friends
//
//  Created by Burak Cüce on 23.05.22.
//

import SwiftUI
import UIKit
import CoreLocation.CLLocation
import MapKit.MKAnnotationView
import MapKit.MKUserLocation


struct MapView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @State private var userTrackingMode: MKUserTrackingMode = .none
    @State var offset: CGFloat = 0
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
            
            GeometryReader { reader in
                
                VStack {
                    BottomSheet(offset: $offset, value: (-reader.frame(in: .global).height + 150))
                        .offset(y: reader.frame(in: .global).height - 150)
                    // adding gesture...
                        .offset(y: offset)
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            withAnimation {
                                
                                if value.startLocation.y > reader.frame(in: .global).midX {
                                    
                                    if value.translation.height < 0 && offset >
                                        (-reader.frame(in: .global).height + 150) {
                                        
                                        offset = value.translation.height
                                    }
                                }
                                
                                if value.startLocation.y < reader.frame(in: .global).midX {
                                    
                                    if value.translation.height < 0 && offset < 0 {
                                        
                                        offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                                    }
                                }
                            }
                            
                        }).onEnded({ (value) in
                            
                            withAnimation {
                                if value.startLocation.y > reader.frame(in: .global).midX {
                                    
                                    if -value.translation.height > reader.frame(in: .global).midX {
                                        
                                        offset = (-reader.frame(in: .global).height + 150)
                                        
                                        return
                                    }
                                    
                                    offset = 0
                                }
                                
                                if value.startLocation.y < reader.frame(in: .global).midX {
                                    
                                    if -value.translation.height < reader.frame(in: .global).midX {
                                        
                                        offset = (-reader.frame(in: .global).height + 150)
                                        
                                        return
                                    }
                                    
                                    offset = 0
                                }
                            }
                        }))
                    
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
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
