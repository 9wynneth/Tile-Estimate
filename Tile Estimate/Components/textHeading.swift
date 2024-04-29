//
//  textHeading.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

struct textHeading: View {
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
          .font(.custom("Inter Bold", size: 20))
          .bold()
          .fontWeight(.black)
          .foregroundColor(Color(hex:"4a382e", transparency: 1.0))
          .lineSpacing(20)
    }
}

#Preview {
    textHeading(text: "kalal")
}
