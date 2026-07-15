//
//  Geography.swift
//  Smarty Tails Game
//
//  Created by Максим  on 15.07.2026.
//

import SwiftUI

struct Geography: View {
    
    @State private var lives = 3
    
    var body: some View {
        
        ZStack {
            Image("GeographyWallpaper")
                .resizable()
                .ignoresSafeArea()
            
            
            VStack {
                HStack {
                    HStack(spacing: 4) {
                        ForEach(0..<lives, id: \.self) { _ in
                            Image("HeartWallpaper")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 38)
                        }
                    }
                    Spacer()
                    Button {
                       
                        
                        
                        
                        
                    } label: {
                        Image("BtnPauseWallpaper")
                            .resizable()
                            .frame(width: 60, height: 64)
                    }
                    
                    
                    
                }
                HStack {
                    Spacer()
                    ZStack {
                        Image("TimeWatchGeographyWallpaper")
                            .resizable()
                            .frame(width: 136, height: 164)
                        Text("60")
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                            .padding(.top, 30)
                    }
                    .offset(y: -60)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Geography()
}
