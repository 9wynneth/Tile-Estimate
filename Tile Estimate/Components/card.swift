//
//  card.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

struct card: View {
    let result: String
    let label: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    init(result: String, label: String, width: CGFloat, height: CGFloat, cornerRadius: CGFloat) {
        self.result = result
        self.label = label
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius

    }
    var body: some View {
        VStack (spacing: 10) {
            textHeading(text: result)
                .padding(.top,5)
            textBody10(text: label)
        }
        .frame(width: width, height: height)
        .background(Color(hex: "Cream", transparency: 0.5))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .padding(5)
    }
}

#Preview {
    card(result: "40", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
}
