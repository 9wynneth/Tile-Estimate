//
//  historyList.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 04/05/24.
//
import SwiftUI

struct historyList: View {
    @EnvironmentObject var historyManager: HistoryManager
    @State private var isEditing = false
    @State private var selectedIndices: Set<Int> = []
    @State private var showSumTotalAlert = false
    @State private var sumTotalData: (tilesNeeded: Int, boxNeeded: Int, totalCost: String, selectedCurrency: String)? = nil

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "c1ada0", transparency: 1.0))
                    .frame(width: .infinity, height: 150)
                
                textHeadingFitur(text: "History")
                    .padding(.top, 65)
                Button(action: {
                    isEditing.toggle()
                    if !isEditing {
                        selectedIndices = Set<Int>()
                    }
                }) {
                    textBody14(text: (isEditing ? "Done" : "Select"))
                        .foregroundColor(Color(hex: "946F5A", transparency: 1.0))
                        .padding(.top, 70)
                        .padding(.leading, 315)
                }
            }
            
            List {
                let reversedEntries = Array(historyManager.historyEntries.reversed())
                
                ForEach(reversedEntries.indices, id: \.self) { index in
                    let historyEntry = reversedEntries[index]
                    
                    if isEditing {
                        HistoryRowView(historyEntry: historyEntry, isSelected: self.selectedIndices.contains(index), isEditing: isEditing)
                            .onTapGesture {
                                toggleSelection(for: index)
                            }
                    } else {
                        HistoryRowView(historyEntry: historyEntry, isSelected: false, isEditing: isEditing)
                    }
                }
                .onDelete(perform: deleteEntry)
            }
            .scrollContentBackground(.hidden)
            .background(Color(hex: "Cream", transparency: 1.0))
            
            .toolbar {
                if isEditing {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button(action: {
                                deleteSelectedItems()
                            }) {
                                Text("Delete All").foregroundColor(.red)
                            }
                            Spacer()
                            Button(action: {
                                calculateSumTotal()
                            }) {
                                Text("Sum Total")
                                    .foregroundColor(Color(hex: "946F5A", transparency: 1.0))
                            }
                        }
                        .padding()
                    }
                }
            }
            .background(Color(hex: "Cream", transparency: 1.0))
            .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)
        .background(Color(hex: "Cream", transparency: 1.0))
        
        .alert(isPresented: $showSumTotalAlert) {
            if let sumTotalData = sumTotalData {
                return Alert(
                    title: Text("Sum Total (with wastage)"),
                    message: Text("Total Tiles Needed: \(sumTotalData.tilesNeeded)\nTotal Box Needed: \(sumTotalData.boxNeeded)"),
                    dismissButton: .default(Text("OK"))
                )
            } else {
                return Alert(
                    title: Text("Sum Total"),
                    message: Text("No items selected"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    private func toggleSelection(for index: Int) {
        if selectedIndices.contains(index) {
            selectedIndices.remove(index)
        } else {
            selectedIndices.insert(index)
        }
    }

    private func deleteEntry(at offsets: IndexSet) {
        for offset in offsets {
            selectedIndices.remove(offset)
        }
        historyManager.historyEntries.remove(atOffsets: offsets)
    }
    
    private func deleteSelectedItems() {
        // Get the original indices of the selected items
        let originalIndices = selectedIndices.map { index in
            historyManager.historyEntries.count - 1 - index
        }
        // Sort the indices in descending order to avoid out-of-bound errors
        let sortedIndices = originalIndices.sorted(by: >)

        // Perform the deletions
        for index in sortedIndices {
            historyManager.historyEntries.remove(at: index)
        }
        
        // Clear the selected indices
        selectedIndices.removeAll()
    }

    
    private func calculateSumTotal() {
        let reversedEntries = Array(historyManager.historyEntries.reversed())
        let selectedHistoryEntries = selectedIndices.compactMap { index in
            index < reversedEntries.count ? reversedEntries[index] : nil
        }

        let totalTilesNeeded = selectedHistoryEntries.reduce(0) { $0 + (Int($1.tilesNeeded) ?? 0) }
        let totalBoxNeeded = selectedHistoryEntries.reduce(0) { $0 + (Int($1.boxNeeded) ?? 0) }
        let totalCost = selectedHistoryEntries.reduce(0) { $0 + removeDecimal($1.cost) }
        let selectedCurrency = selectedHistoryEntries.first?.selectedCost ?? ""

        let formattedTotalCost = addDecimal(totalCost)

        sumTotalData = (totalTilesNeeded, totalBoxNeeded, formattedTotalCost, selectedCurrency)
        showSumTotalAlert = true
    }

    private func removeDecimal(_ cost: String) -> Int {
        return Int(cost.replacingOccurrences(of: ".", with: "")) ?? 0
    }
    
    private func addDecimal(_ totalCost: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedTotalCost = formatter.string(from: NSNumber(value: totalCost)) ?? ""
        return formattedTotalCost
    }
}

struct HistoryRowView: View {
    var historyEntry: history
    var isSelected: Bool
    var isEditing: Bool
    
    var body: some View {
        HStack {
            if isEditing {
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 14))
                        .padding(.trailing, 4)
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.secondary)
                        .padding(.trailing, 4)
                        .font(.system(size: 14))
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                textBody14(text: "\(historyEntry.area)\(historyEntry.selectedArea)2, \(historyEntry.tileLength)x\(historyEntry.tileWidth)\(historyEntry.selectedTile), \(historyEntry.selectedShape)")
                    .font(.body)
                    .foregroundColor(Color.gray)
                
                HStack(spacing: 2) {
                    textBody14(text: "\(historyEntry.wastage)% wastage:")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    textBody14(text: "\(historyEntry.tilesNeeded) tiles,")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    textBody14(text: "\(historyEntry.boxNeeded) box,")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    Text("\(historyEntry.selectedCost). \(historyEntry.cost)")
                        .font(.custom("Inter Bold", size: 12))
                        .foregroundColor(Color.gray)
                }
                HStack(spacing: 2) {
                    textBody14(text: "No wastage:")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    textBody14(text: "\(historyEntry.tilesNeededNo) tiles,")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    textBody14(text: "\(historyEntry.boxNeededNo) box,")
                        .font(.body)
                        .foregroundColor(Color.gray)
                    Text("\(historyEntry.selectedCost). \(historyEntry.costNo)")
                        .font(.custom("Inter Bold", size: 12))
                        .foregroundColor(Color.gray)
                }
            }
        }
        .padding(.leading, 2)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let historyManager = HistoryManager()
        historyManager.historyEntries = [
            history(area: "50", tileLength: "23", tileWidth: "12", tilesNeeded: "222", boxNeeded: "5", cost: "100", tilesNeededNo: "123", boxNeededNo: "3", costNo: "90", selectedArea: "m", selectedTile: "cm", selectedCost: "SGD", wastage: "50", selectedShape: "Triangle")
        ]
        
        return historyList().environmentObject(historyManager)
    }
}


