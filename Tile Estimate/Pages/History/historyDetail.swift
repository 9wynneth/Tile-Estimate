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
        // Details view to display the full details of a history entry
        VStack {
            Text("Area Length: \(historyEntry.areaLength)")
            Text("Area Width: \(historyEntry.areaWidth)")
            // Add other properties as needed
        }
    }
}

//#Preview {
//    historyDetail()
//}
