//
//  historyDetail.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 05/05/24.
//

import SwiftUI

struct historyDetail: View {
    var historyEntry: history

    var body: some View {
        // Detail view
        Text("Details for \(historyEntry.areaLength) x \(historyEntry.areaWidth)")
    }
}

//#Preview {
//    historyDetail()
//}
