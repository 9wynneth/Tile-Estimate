//
//  coba.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 28/04/24.
//

import SwiftUI

struct coba: View {
    @State private var selectedOption = "Option 1"
    let options = ["Option 1", "Option 2", "Option 3"]
    @State private var selection: String = "a"
    let items: [String] = ["a","b"]
    
    var body: some View {
        VStack {
            Picker("Options", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .accentColor(.orange)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            
        }
    }
}


#Preview {
    coba()
}
