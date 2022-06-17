//
//  FindFriendRowView.swift
//  Friends
//
//  Created by Burak Cüce on 03.06.22.
//

import SwiftUI

struct FindFriendRowView: View {
    var body: some View {
        ZStack {
            
            HStack(spacing: 20) {
                
                Button {
                    print("Auf Profil klicken")
                } label: {
                    Image("Profil-2")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())

                
                ZStack {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Button {
                            print("Auf Profil klicken")
                        } label: {
                            Text("Laura Mustermann")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        .buttonStyle(PlainButtonStyle())

                        
                        HStack {
                            
                            Button {
                                print("Hinzufügen")
                            } label: {
                                Text("Hinzufügen")
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .background(Color.blue.opacity(0.8))
                                    .cornerRadius(10)
                            }
                            .buttonStyle(PlainButtonStyle())

                            
                            Button {
                                print("Entfernen")
                            } label: {
                                Text("Entfernen")
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .background(Color.gray.opacity(0.6))
                                    .cornerRadius(20)
                            }
                            .buttonStyle(PlainButtonStyle())

                        }
                    }
                    
                }
            }
        }
    }
}

struct FindFriendRowView_Previews: PreviewProvider {
    static var previews: some View {
        FindFriendRowView()
    }
}
