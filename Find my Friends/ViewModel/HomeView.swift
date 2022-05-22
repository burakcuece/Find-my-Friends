//
//  HomeView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 22.05.22.
//

import SwiftUI

struct HomeView : View {
    
    @State var index = 0
    @Namespace var name
    
    var body: some View {
        
        
        VStack {
            
            Text("Willkommen!")
                .font(.system(size: 50))
            
            Image(systemName: "person.2.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .opacity(0.8)
            
            Text("Find my Friends")
                .font(.title2)
            
            HStack(spacing: 0) {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        index = 0
                    }
                    
                }) {
                    VStack {
                        
                        Text("Login")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black : .gray)
                        
                        ZStack {
                            
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 4)
                            
                            if index == 0 {
                                
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        index = 1
                    }
                    
                }) {
                    VStack {
                        
                        Text("Registrieren")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black : .gray)
                        
                        
                        ZStack {
                            
                            Capsule()
                                .fill(Color.black.opacity(0.04))
                                .frame(height: 4)
                            
                            if index == 1 {
                                
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
            .padding(.top, 30)
            
            if index == 0 {
                
                SignInView()
            } else {
                SignUpView()
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
