//
//  textBody10.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

struct textBody10: View {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
          .font(.custom("Inter Bold", size: 12))
          .fontWeight(.bold)
          .foregroundColor(Color(hex:"4a382e", transparency: 1.0))
    }
}

#Preview {
    textBody10(text: "Tiles Needed")
}
