//
//  RulesVIew.swift
//  SugarRushJelly
//
//  Created by Nicolae Chivriga on 18/12/2024.
//

import SwiftUI


struct RulesVIew: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            Image("rules")
                .overlay {
                    Text("Control two jelly-like characters by tapping the screen to change their color. Orange jellies can only eat orange ones, while purple jellies can only eat purple ones. Time your taps carefully to collect the right jellies and score points!")
                        .font(.system(size: 15, weight: .medium, design: .monospaced))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 60)
                        .offset(y: 40)
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Image("backbtn")
            .resizable()
            .frame(width: 30, height: 30)
            .onTapGesture {
                dismiss()
            })
    }
}
