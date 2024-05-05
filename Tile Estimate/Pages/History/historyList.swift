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
    @State private var selectedItems: Set<history> = []

    var body: some View {
        NavigationView {
            List {
                ForEach(historyManager.historyEntries) { historyEntry in
                    if isEditing {
                        HistoryRowView(historyEntry: historyEntry, isSelected: isSelected(historyEntry), isEditing: isEditing)
                            .onTapGesture {
                                toggleSelection(for: historyEntry)
                            }
                    } else {
                        NavigationLink(destination: historyDetail(historyEntry: historyEntry)) {
                            HistoryRowView(historyEntry: historyEntry, isSelected: false, isEditing: isEditing)
                        }
                    }
                }
                .onDelete(perform: deleteEntry)
            }
            .navigationBarTitle("History")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text(isEditing ? "Done" : "Select")
                            .foregroundColor(Color(hex: "946F5A", transparency: 0.5))
                    }
                }
            }
            .toolbar {
                if isEditing {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button(action: {
                                
                            }) {
                                Text("Delete All").foregroundColor(.red)
                            }
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Text("Sum Total")
                                    .foregroundColor(Color(hex: "946F5A", transparency: 0.5))
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .ignoresSafeArea()
        .background(Color(hex: "F2EEEB", transparency: 1.0))
        .onAppear{
            print("History Entries: \(historyManager.historyEntries)")
        }

    }

    private func isSelected(_ historyEntry: history) -> Bool {
        selectedItems.contains(historyEntry)
    }

    private func toggleSelection(for historyEntry: history) {
        if selectedItems.contains(historyEntry) {
            selectedItems.remove(historyEntry)
        } else {
            selectedItems.insert(historyEntry)
        }
    }

    private func deleteEntry(at offsets: IndexSet) {
        historyManager.historyEntries.remove(atOffsets: offsets)
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
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.secondary)
                }
            }
            VStack(alignment: .leading) {
                Text("Area Length: \(historyEntry.areaLength)")
                Text("Area Width: \(historyEntry.areaWidth)")

            }
        }
        .padding()

    }
}


//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        let historyManager = HistoryManager()
//        historyManager.historyEntries = [
//            history(areaLength: "300", areaWidth: "300", tileLength: "40", tileWidth: "40")
//            // Add more sample history entries as needed
//        ]
//        
//        return historyList(historyManager: historyManager)
//    }
//}

