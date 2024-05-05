//
//  history.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 04/05/24.
//

import SwiftUI

struct history {
    var areaLength: String
    var areaWidth: String
    var tileLength: String
    var tileWidth: String
}

class HistoryManager: ObservableObject {
    @Published var historyEntries: [history] = []
    
    func addEntry(entry: history) {
        historyEntries.append(entry)
    }
    
    // Implement delete functionality if needed
}
