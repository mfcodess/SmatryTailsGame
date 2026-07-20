//
//  Geography.swift
//  Smarty Tails Game
//
//  Created by Максим  on 15.07.2026.
//

import SwiftUI
internal import Combine

struct Question {
    let title: String
    let answers: [String]
    let correctAnswer: String
}

struct Geography: View {
    
    @Binding var currentScreen: Screens
    
    @State private var lives = 3
    @State private var currentQuestionIndex = 0
    @State private var showSetting = false
    @State private var time = 60
    @State private var isGameOver = false
    @State private var isPaused = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //Список вопросов
    let questions = [
        Question(
            title: "What is a capital of Ukraine",
            answers: ["Mariupol", "Kyiv", "Donetsk", "Lviv"],
            correctAnswer: "Kyiv"),
        
        Question(
            title: "Which is the largest ocean?",
            answers: ["Atlantic Ocean", "Indian Ocean", "Pacific Ocean", "Arctic Ocean"],
            correctAnswer: "Pacific Ocean"),]
    
    var body: some View {
        
        let currentQuestion = questions[currentQuestionIndex]
        
        //MARK: - ВЕРХНИЙ ЕКРАН
        ZStack {
            Image("GeographyWallpaper")
                .resizable()
                .ignoresSafeArea()
            
            //MARK: - СРЕДНИЙ ЕКРАН
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
                        withAnimation(.easeInOut(duration: 0.4)) {
                            showSetting = true
                        }
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
                        Text("\(time)")
                            .font(.system(size: 35, weight: .bold, design: .rounded))
                            .foregroundStyle(.black)
                            .padding(.top, 30)
                    }
                    .offset(y: -60)
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            //MARK: - НИЖНИЙ ЕКРАН
            
            VStack {
                Spacer()
                ZStack {
                    Image("GreenGameWallpaper")
                        .resizable()
                        .scaledToFit()
                    
                    Text("What is a capital of Ukraine?")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 260)
                }
                .padding(.horizontal, 30)
                
                HStack {
                    answerButton(nameImage: "BlueGameButton", nameAnswer: currentQuestion.answers[0])
                    answerButton(nameImage: "BlueGameButton", nameAnswer: currentQuestion.answers[1])
                }
                
                HStack {
                    answerButton(nameImage: "BlueGameButton", nameAnswer: currentQuestion.answers[2])
                    answerButton(nameImage: "BlueGameButton", nameAnswer: currentQuestion.answers[3])
                }
            }
            .padding()
            
            if showSetting {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                GeographySetting(showSettings: $showSetting)
            }
        }
        
        .onReceive(timer) { _ in
            if !isGameOver && !isPaused {
                updateTimer()
            }
        }
    }
    //MARK: Функция которая создает кнопку ответа
    func answerButton(nameImage: String, nameAnswer: String) -> some View{
        ZStack {
            Button {
                
            } label: {
                Image(nameImage)
                    .resizable()
                    .scaledToFit()
            }
            
            Text(nameAnswer)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                .frame(width: 160)
        }
    }
    
    //MARK: Функция которая запускает Таймер
    func updateTimer() {
        if time > 0 {
            time -= 1
        } else {
            isGameOver = true
        }
    }
}

#Preview {
    Geography(currentScreen: .constant(.geography))
}
