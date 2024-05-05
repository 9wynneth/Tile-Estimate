//
//  historyList.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 04/05/24.
//

import SwiftUI

struct historyList: View {
    @ObservedObject var historyManager: HistoryManager
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            VStack(spacing:0) {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex: "c1ada0", transparency: 1.0))
                            .frame(width: .infinity, height: 150)

                        Text("History")
                            .padding(.top, 65)
                    }
                    .navigationBarItems(trailing:
                        Button(action: {
                            isEditing.toggle()
                        }) {
                            Text(isEditing ? "Done" : "Select")
                                .foregroundColor(.black)
                        }.padding(.top, 65)
                    )
                }.zIndex(1.0)

                List {
                    ForEach(historyManager.historyEntries.indices, id: \.self) { index in
                        let historyEntry = historyManager.historyEntries[index]
                        if isEditing {
                            // Display checkboxes if in editing mode
                            Button(action: {
                                // Toggle selection of item
                                historyManager.historyEntries[index].isSelected.toggle()
                            }) {
                                HStack {
                                    if historyEntry.isSelected {
                                        Image(systemName: "circle.fill")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    } else {
                                        Image(systemName: "circle")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }
                                    HistoryRowView(historyEntry: historyEntry)
                                }
                            }
                        } else {
                            // Display normal rows if not in editing mode
                            NavigationLink(destination: historyDetail(historyEntry: historyEntry)) {
                                HistoryRowView(historyEntry: historyEntry)
                            }
                        }
                    }
                    .onDelete(perform: deleteEntry)
                }
                .offset(y:-15)
                .zIndex(0.0)
            }.ignoresSafeArea()
        }.background(Color(hex: "F2EEEB", transparency: 1.0))
    }

    private func deleteEntry(at offsets: IndexSet) {
        historyManager.historyEntries.remove(atOffsets: offsets)
    }
}

struct HistoryRowView: View {
    var historyEntry: history

    var body: some View {
        // Customize the appearance of each row in the list
        VStack(alignment: .leading) {
            Text("Area Length: \(historyEntry.areaLength)")
            Text("Area Width: \(historyEntry.areaWidth)")
            // Add other properties as needed
        }
        .padding()
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let historyManager = HistoryManager()
        historyManager.historyEntries = [
            history(areaLength: "300", areaWidth: "300", tileLength: "40", tileWidth: "40")
            // Add more sample history entries as needed
        ]
        
        return historyList(historyManager: historyManager)
    }
}

