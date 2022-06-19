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
                    TextField("Suche Freunde" , text: .constant(""))
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.ultraThickMaterial)
                        }
                    FriendList()
                }
                
                .padding()
                .padding(.top,15)
                
            }
        }
    }
    
    @ViewBuilder
    func FriendList() -> some View {
        VStack(spacing: 25) {
            ForEach(friends) { friend in
                HStack(spacing: 12) {
                    Text("#\(getIndex(friend: friend) + 1)")
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                    
                    Image(friend.friendImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                    Button {
                        print("Liked")
                    } label: {
                        Image(systemName: friend.isLiked ? "suit.heart.fill" : "suit.heart")
                            .font(.title3)
                            .foregroundColor(friend.isLiked ? .red : .primary)
                    }
                    
                    Button {
                        print("Tapped")
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    
                    
                }
            }
        }
        .padding(.top,15)
    }
    
    func getIndex(friend: Friend) -> Int {
        return friends.firstIndex { CFriend in
            CFriend.id == friend.id
        } ?? 0
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
