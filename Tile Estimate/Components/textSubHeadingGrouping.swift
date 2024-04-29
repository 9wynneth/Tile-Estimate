//
//  textSubHeadingGrouping.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

struct textSubHeadingGrouping: View {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 13, weight: .regular))
            .foregroundColor(Color(hex: "3C3C43", transparency: 0.6))
            .textCase(.uppercase)
    }
}

#Preview {
    textSubHeadingGrouping(text: "area to cover")
}
