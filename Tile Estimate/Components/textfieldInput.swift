//
//  textfieldInput.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

struct textfieldInput: View {
    
    @State private var text = ""
    let placeholder: String
    let font: CGFloat
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let satuan: String
    
    init(placeholder: String, font: CGFloat, width: CGFloat, height: CGFloat, cornerRadius: CGFloat, satuan: String) {
        self.placeholder = placeholder
        self.font = font
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.satuan = satuan
    }
    
    var body: some View {
        if satuan.isEmpty {
            HStack(spacing: 0) { // Wrap in HStack
                TextField(placeholder, text: $text) { _ in
                    // Handle editing (optional)
                }
                .font(.system(size: font))
                .multilineTextAlignment(.trailing)
                .padding(4)
            }
            .frame(width: width, height: height)
            .background(Color(hex: "#946F5A", transparency: 0.1))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
        else {
            HStack(spacing: 0) { // Wrap in HStack
                TextField(placeholder, text: $text) { _ in
                    // Handle editing (optional)
                }
                .font(.system(size: font))
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .padding(4)
                Text(satuan)
                    .foregroundColor(.black)
                    .font(.system(size: font))
                    .padding(.trailing,4)
            }
            .frame(width: width, height: height)
            .background(Color(hex: "#946F5A", transparency: 0.1))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
    }
}

#Preview {
    textfieldInput(placeholder: "blabla", font: 12, width: 70, height: 32, cornerRadius: 8, satuan: "")
}


