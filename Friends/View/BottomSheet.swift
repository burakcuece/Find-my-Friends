//
//  BottomSheet.swift
//  Friends
//
//  Created by Burak Cüce on 20.06.22.
//

import SwiftUI
import UIKit

struct BottomSheet: View {
    
    @State var text = ""
    @Binding var offset: CGFloat
    var value : CGFloat
    
    var body: some View {
        VStack {
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50, height: 50)
                .padding(.top)
                .padding(.bottom, 5)
            
            HStack(spacing: 15) {
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22))
                    .foregroundColor(Color.gray)
                
                TextField("Suche Freund/innen", text: $text) { (status) in
                    
                    withAnimation {
                        offset = value
                    }
                    
                } onCommit: {
                    
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            // BlurView
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(15)
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(alignment: .leading, spacing: 15) {
                    ForEach(1...15, id: \.self) { count in
                        
                        Text("Profil")
                            .foregroundColor(Color.black)
                        
                        Divider()
                            .padding(.top, 10)
                    }
                }
                .padding()
                .padding(.top)
            }
        }
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(15)
    }
}

