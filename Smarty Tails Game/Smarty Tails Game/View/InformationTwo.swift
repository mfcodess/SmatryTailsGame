//
//  InformationTwo.swift
//  Smarty Tails Game
//
//  Created by Максим  on 11.07.2026.
//

import SwiftUI

struct InformationTwo: View {
    
    @Binding var currentScreen: Screens
    
    var body: some View {
        
        ZStack {
            Image("LoadingWallpaper")
                .resizable()
                .ignoresSafeArea()
            

            VStack {
                Image("InformationTwoWallpaper")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        currentScreen = .menu
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
    InformationTwo(currentScreen: .constant(.informationTwo))
}
