import SwiftUI

struct splashScreenPage: View {
    
    @State private var logoOpacity = 0.0
    @State private var textOpacity = 0.0
    @State private var animationDone = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color(hex: "Cream", transparency: 1.0)
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
            .navigationTitle("") // Hide navigation bar title
            .navigationBarHidden(true) // Hide navigation bar
            .navigationBarBackButtonHidden(true) // Hide back button
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if animationDone {
                    // Push ContentView onto navigation stack
                    NavigationLink(destination: QuickCount(), isActive: .constant(true)) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    splashScreenPage()
}
