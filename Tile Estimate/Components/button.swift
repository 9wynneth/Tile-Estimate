//
//  btnSatuan.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 26/04/24.
//

import SwiftUI

struct button: View {
    let icon: String
    let text: String
    let font: Int
    let width: Int
    let height: Int
    let bgColor: String
    let bgTransparency: Double
    let fontColor: String
    let fontTransparency: Double
    let cornerRadius: CGFloat
    let action: (() -> Void)?

    init(icon: String, text: String, width: Int, height: Int, font: Int, bgColor: String, bgTransparency: Double, fontColor: String, fontTransparency: Double, cornerRadius: CGFloat, action: (() -> Void)? = nil) {
        self.icon = icon
        self.text = text
        self.width = width
        self.height = height
        self.font = font
        self.bgColor = bgColor
        self.bgTransparency = bgTransparency
        self.fontColor = fontColor
        self.fontTransparency = fontTransparency
        self.cornerRadius = cornerRadius
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            if icon.isEmpty { 
                        Text(text)
                            .font(.system(size: CGFloat(font), weight: .medium))
                            .foregroundColor(Color(hex: fontColor, transparency: fontTransparency))
                    } else {
                        HStack(spacing: 4) {
                            Spacer()
                            Text(text)
                                .font(.system(size: CGFloat(font), weight: .medium))
                                .foregroundColor(Color(hex: fontColor, transparency: fontTransparency))
                            Image(systemName: icon)
                                .font(.system(size: CGFloat(font), weight: .medium))
                                .foregroundColor(Color(hex: fontColor, transparency: fontTransparency))
                            Spacer()
                        }
                    }
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: CGFloat(width), height: CGFloat(height))
        .background(Color(hex: bgColor, transparency: bgTransparency))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
//        LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing) // Example gradient, replace with your desired gradient


    }
}

#Preview {
    button(icon: "chevron.up.chevron.down", text:"m", width: 57, height:23, font: 12, bgColor: "#c1ada0", bgTransparency: 1.0 , fontColor:"3C3C43", fontTransparency: 0.6, cornerRadius: 20)
}
