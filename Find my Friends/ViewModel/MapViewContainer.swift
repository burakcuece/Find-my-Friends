//
//  MapViewContainer.swift
//  Find my Friends
//
//  Created by Burak Cüce on 25.05.22.
//

import MapKit

class MapViewContainer: ObservableObject {
    
    @Published public private(set) var mapView = MKMapView(frame: .zero)
    
}
