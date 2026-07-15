//
//  AchievementsScreenMenu.swift
//  Smarty Tails Game
//
//  Created by Максим  on 13.07.2026.
//

import SwiftUI

struct AchievementsScreenMenu: View {
    
    @Binding var currentScreen: Screens
    
    var body: some View {
        
        ZStack {
            Image("EmptyWallpaper")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        currentScreen = .menu
                    }label: {
                        Image("BtnMenuWallpaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                Spacer()
                Image("AchievementsChikenWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 557)
                
                Spacer()
                HStack(spacing: 80) {
                    Button {
                        
                    } label: {
                        Image("ArrowLeftWallpaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 72)
                    }
                    
                    Button {
                        
                    } label: {
                        Image("ArrowRightWallpaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 72)
                    }
                }
            }
        }
    }
}

#Preview {
    AchievementsScreenMenu(currentScreen: .constant(.achievement))
}
