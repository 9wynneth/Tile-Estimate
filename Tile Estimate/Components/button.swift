//
//  btnSatuan.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 26/04/24.
//

import SwiftUI

struct btnSatuan: View {
    let icon: String
    let text: String
    let font: Int
    let width: Int
    let height: Int
    let bgColor: String
    let bgTransparency: Double
    let fontColor: String
    let fontTransparency: Double
    let action: (() -> Void)?

    init(icon: String, text: String, width: Int, height: Int, font: Int, bgColor: String, bgTransparency: Double, fontColor: String, fontTransparency: Double, action: (() -> Void)? = nil) {
        self.icon = icon
        self.text = text
        self.width = width
        self.height = height
        self.font = font
        self.bgColor = bgColor
        self.bgTransparency = bgTransparency
        self.fontColor = fontColor
        self.fontTransparency = fontTransparency
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            if icon.isEmpty { // Check if icon is empty
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
        .background(Color(hex: "#c1ada0", transparency: 1))
        .clipShape(RoundedRectangle(cornerRadius: 20))

    }
}

#Preview {
    btnSatuan(icon: "chevron.up.chevron.down", text:"m", width: 70, height:22, font: 12, bgColor: "#c1ada0", bgTransparency: 1.0 , fontColor:"3C3C43", fontTransparency: 0.6)
}
