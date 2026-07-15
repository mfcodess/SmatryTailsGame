//
//  Menu.swift
//  Smarty Tails Game
//
//  Created by Максим  on 11.07.2026.
//

import SwiftUI

struct Menu: View {
    
    @Binding var currentScreen: Screens
    
    @State private var showSetting = false
    @State private var showAchievement = false
    
    var body: some View {
        
        ZStack {
            
            Image("MenuWallpaper")
                .resizable()
                .ignoresSafeArea()
            
            //MARK: - ВВЕРХ
            
            VStack {
                HStack {
                    Button {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            currentScreen = .informationOne
                        }
                    } label: {
                        Image("BtnInfoWallpaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            currentScreen = .achievement
                        }
                    } label: {
                        Image("BtnAchievementWallpaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            showSetting = true
                        }
                    } label: {
                        Image("BtnSettingWallpaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                }
                .padding(.horizontal)
                
                //MARK: - ЦЕНТР
                
                Image("IconSmartyTailsWallpaper")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 170)
                
                Spacer()
                //MARK: - НИЗ
                Button {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        currentScreen = .subject
                    }
                } label: {
                    Image("BtnStartWallpaper")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                }
            }
            
            if showSetting {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .transition(.opacity)
                
                SettingScreenMenu(showSetting: $showSetting)
                    .transition(.scale(scale: 0.8).combined(with: .opacity))
            }
        }
    }
}

#Preview {
    Menu(currentScreen: .constant(.menu))
}

