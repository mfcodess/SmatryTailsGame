//
//  LoadingView.swift
//  Smarty Tails Game
//
//  Created by Максим  on 08.07.2026.
//

import SwiftUI

struct Loading: View {
    
    @Binding var currentScreen: Screens
    
    //MARK: - Состояния и параметры анимации экрана загрузки
    @State private var isLoading = true
    @State private var rotation: Double = 0
    @State private var scale: Double = 0
    @State private var opacity: Double = 0.4
    @State private var pulseScale: Double = 1.0
    
    //MARK: - UI
    var body: some View {
        
        if isLoading {
            ZStack {
                
                Image("LoadingWallpaper")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("IconSmartyTailsWallpaper")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    ZStack {
                        Image("TimeWatchWallpaper") 
                            .resizable()
                            .scaledToFit()
                            .frame(width: 122, height: 151)
                            .padding(.bottom, 30)
                        
                        Image("WatchHandWallpaper")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 54)
                            .rotationEffect(Angle(degrees: rotation))
                    }
                    ///Увелечение-уменьшение часов при появлении
                    .scaleEffect(scale)
                    ///Эффект постоянной пульсации часов
                    .scaleEffect(pulseScale)
                }
                ///Анимация появления всего содержимого экрана
                .scaleEffect(scale)
                ///Плавное появления через прозрачноть
                .opacity(opacity)
            }
            
            .onAppear {
                
                withAnimation(.easeInOut(duration: 0.8)) {
                    opacity = 1
                    scale = 1
                }
                
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
                
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    pulseScale = 1.25
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isLoading = false
                  
                            currentScreen = .informationOne
                        
                    }
                }
            }
        } 
    }
}

#Preview {
    Loading(currentScreen: .constant(.loading))
}
