//
//  history.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 04/05/24.
//

import SwiftUI

struct history: Identifiable {
    let id = UUID()
    let areaLength: String
    let areaWidth: String
    let tileLength: String
    let tileWidth: String
    var isSelected: Bool = false // Added property to track selection
}

class HistoryManager: ObservableObject {
    @Published var historyEntries: [history] = []
}
