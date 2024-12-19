//
//  SettingsView.swift
//  SugarRushJelly
//
//  Created by Nicolae Chivriga on 18/12/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
           Image("rules")
                .overlay {
                    VStack {
                        Button {
                            requestReview()
                        } label: {
                            Image("rectbn")
                                .overlay {
                                    StrokeText(text: "Rate Us", width: 4, color: .purple)
                                        .foregroundStyle(.white)
                                        .font(.custom(Font.alfaSlab, size: 48))
                                }
                        }

                        
                    }
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
