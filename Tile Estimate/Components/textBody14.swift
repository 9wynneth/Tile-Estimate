//
//  textBody14.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 05/05/24.
//

import SwiftUI

struct textBody14: View {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
          .font(.custom("Inter Bold", size: 14))
          .fontWeight(.bold)
          .lineSpacing(20)
    }
}

