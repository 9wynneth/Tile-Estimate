//
//  colorConverter.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

extension Color {
    init(hex: String, transparency: String) {
        // Parse the transparency string to get values for light and dark modes
        let transparencies = transparency.split(separator: ":").map { Double($0.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 1.0 }
        let lightTransparency = transparencies.first ?? 1.0
        let darkTransparency = transparencies.count > 1 ? transparencies[1] : lightTransparency

        // Determine the current interface style
        let currentTransparency = UITraitCollection.current.userInterfaceStyle == .dark ? darkTransparency : lightTransparency

        // First, try to create a color using the named color
        if let color = UIColor(named: hex) {
            let uiColor = color.withAlphaComponent(CGFloat(currentTransparency))
            self.init(uiColor)
            return
        }

        // If not a named color, assume it's a hex string
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexString = hexString.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        if Scanner(string: hexString).scanHexInt64(&rgb) {
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0

            self.init(.sRGB, red: red, green: green, blue: blue, opacity: currentTransparency)
        } else {
            self.init(.sRGB, red: 0, green: 0, blue: 0, opacity: currentTransparency)
        }
    }

    // Overloaded init to accept Double transparency
    init(hex: String, transparency: Double) {
        self.init(hex: hex, transparency: "\(transparency)")
    }
}
