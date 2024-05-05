//
//  history.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 04/05/24.
//

import SwiftUI

struct history: Identifiable, Hashable {
    let id: String
    var areaLength: String
    var areaWidth: String
    var tileLength: String
    var tileWidth: String

    // Add other properties as needed

    init(areaLength: String, areaWidth: String, tileLength: String, tileWidth: String) {
        self.id = "\(areaLength)-\(areaWidth)"
        self.areaLength = areaLength
        self.areaWidth = areaWidth
        self.tileLength = tileLength
        self.tileWidth = tileWidth

    }
}

class HistoryManager: ObservableObject {
    @Published var historyEntries: [history] = []
}
