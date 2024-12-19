//
//  MenuView.swift
//  SugarRushJelly
//
//  Created by Nicolae Chivriga on 12/12/2024.
//

import SwiftUI

//https://plays.org/game/little-world-jellys/
struct MenuView: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("logotip")
                    .resizable()
                    .scaledToFit()
                
                NavigationLink {
                    GameView()
                } label: {
                    Image("rectbn")
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            StrokeText(text: "Play", width: 4, color: .purple)
                                .foregroundStyle(.white)
                                .font(.custom(Font.alfaSlab, size: 48))
                        }
                }

                
                NavigationLink {
                    RulesVIew()
                } label: {
                    Image("rectbn")
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            StrokeText(text: "Rules", width: 4, color: .purple)
                                .foregroundStyle(.white)
                                .font(.custom(Font.alfaSlab, size: 48))
                        }
                }

                
                NavigationLink {
                    SettingsView()
                } label: {
                    Image("rectbn")
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            StrokeText(text: "Settings", width: 4, color: .purple)
                                .foregroundStyle(.white)
                                .font(.custom(Font.alfaSlab, size: 48))
                        }
                }

                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}
struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
