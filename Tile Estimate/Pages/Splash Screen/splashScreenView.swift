//  splashScreenView.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 26/04/24.
//

import SwiftUI

struct splashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var logoOpacity = 0.0
    @State private var textOpacity = 0.0
    @State private var animationDone = false
    
    var body: some View {
        if isActive {
             QuickCount()
        } else {
            ZStack {  // Centering using ZStack
                GeometryReader { geometry in
                    VStack {
                        GeometryReader { geometry in
                            ZStack {
                                Color(hex: "F2EEEB", transparency: 1.0)
                                    .ignoresSafeArea()
                                VStack {
                                    VStack(spacing: 20) {
                                        Image("Logo")
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width * 0.5)
                                            .opacity(logoOpacity)
                                            .animation(.easeInOut(duration: 1.0).delay(0)) // Logo animation
                                        
                                        Text("TILE ESTIMATE")
                                            .font(.custom("Inter Extra Bold", size: 24))
                                            .tracking(3.96)
                                            .lineSpacing(20)
                                            .transition(.move(edge: .leading))
                                            .opacity(textOpacity)
                                            .animation(.easeInOut(duration: 1.0).delay(0)) // Text animation
                                    }
                                    Text("COUNT TILES, PLAN SMARTER")
                                        .font(.custom("Inter Extra Bold", size: 12))
                                        .foregroundColor(Color(#colorLiteral(red: 0.58, green: 0.44, blue: 0.35, alpha: 1)))
                                        .tracking(3.96)
                                        .lineSpacing(20)
                                        .transition(.move(edge: .leading))
                                        .opacity(textOpacity)
                                        .animation(.easeInOut(duration: 0.5).delay(1.0))
                                        .padding(.top, 0)
                                }
                                .opacity(animationDone ? 1.0 : 0.0)
                            }
                            .onAppear {
                                withAnimation {
                                    logoOpacity = 1.0
                                    textOpacity = 1.0
                                    animationDone = true
                                }
                            }
                        }
                        .navigationTitle("")
                        .navigationBarHidden(true) // Hide navigation bar
                        .navigationBarBackButtonHidden(true) // Hide back button
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
     }
}

#Preview {
    splashScreenView()
}
