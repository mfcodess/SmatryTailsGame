//
//  InformationOne.swift
//  Smarty Tails Game
//
//  Created by Максим  on 10.07.2026.
//

import SwiftUI

struct InformationOne: View {
    
    @Binding var currentScreen: Screens
    
    var body: some View {
        
        ZStack {
            Image("LoadingWallpaper")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("InformationOneWallpaper")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        currentScreen = .informationTwo
                    }
                } label: {
                    Image("BtnContinueWallpaper")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                }
            }
        }
    }
}

#Preview {
    InformationOne(currentScreen: .constant(.informationOne))
}



