//
//  history.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 04/05/24.
//

import SwiftUI

struct history: Identifiable, Hashable, Codable {
    let id: String
    var area: String
    var tileLength: String
    var tileWidth: String
    var tilesNeeded: String
    var boxNeeded: String
    var cost: String
    var tilesNeededNo: String
    var boxNeededNo: String
    var costNo: String
    var selectedArea: String
    var selectedTile: String
    var selectedCost: String
    var wastage: String
    var selectedShape: String

    init(area: String,tileLength: String, tileWidth: String, tilesNeeded: String, boxNeeded: String, cost: String, tilesNeededNo: String, boxNeededNo: String, costNo: String, selectedArea: String, selectedTile: String, selectedCost: String, wastage: String, selectedShape: String) {
        self.id = "\(area)-\(tileLength)"
        self.area = area
        self.tileLength = tileLength
        self.tileWidth = tileWidth
        self.tilesNeeded = tilesNeeded
        self.boxNeeded = boxNeeded
        self.cost = cost
        self.tilesNeededNo = tilesNeededNo
        self.boxNeededNo = boxNeededNo
        self.costNo = costNo
        self.selectedArea = selectedArea
        self.selectedTile = selectedTile
        self.selectedCost = selectedCost
        self.wastage = wastage      
        self.selectedShape = selectedShape


    }
}

class HistoryManager: ObservableObject {
    @Published var historyEntries: [history] = [] {
        didSet {
            saveHistory()
        }
    }

    private let historyKey = "HistoryEntries"

    init() {
        loadHistory()
    }

    private func saveHistory() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(historyEntries) {
            UserDefaults.standard.set(encoded, forKey: historyKey)
        }
    }

    private func loadHistory() {
        if let data = UserDefaults.standard.data(forKey: historyKey) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([history].self, from: data) {
                historyEntries = decoded
                return
            }
        }
        historyEntries = []
    }
}
