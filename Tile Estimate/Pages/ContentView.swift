//
//  ContentView.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 26/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Binding var hist: Bool
    @Binding var isActive: Bool
    @StateObject private var historyManager = HistoryManager()


    
    var body: some View {
        TabView {
            QuickCount()
                .tabItem {
                    Label("Quick Count", systemImage: "wand.and.stars.inverse")
                }
                .environmentObject(HistoryManager())
            
            historyList()
                .environmentObject(historyManager) 
                .tabItem {
                    Label("History", systemImage: "list.clipboard")
                }
        }.accentColor(Color(hex: "946F5A", transparency: 1.0))
        

    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(hist: .constant(true)) // Example binding to hist
//            .modelContainer(for: Item.self, inMemory: true)
//    }
//}
