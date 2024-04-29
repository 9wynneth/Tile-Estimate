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

    var body: some View {
        splashScreenView()

    }

}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
