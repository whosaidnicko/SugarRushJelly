//
//  LoadingView.swift
//  SugarRushJelly
//
//  Created by Nicolae Chivriga on 12/12/2024.
//

import SwiftUI


struct LoadingView: View {
    @State var rotateActing: Bool = false
    @State var goToMenu: Bool = false
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            NavigationLink("", destination: MenuView(), isActive: $goToMenu)
            VStack {
                Image("logotip")
                
                Image("shikoladki")
                    .rotationEffect(.degrees(rotateActing ? 720 : 0))
            }
            
            
        }
        .onAppear() {
            withAnimation(Animation.linear(duration: 3.5)) {
                rotateActing = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                goToMenu = true 
            }
        }
    }
}
