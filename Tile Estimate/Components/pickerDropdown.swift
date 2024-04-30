//
//  pickerDropdown.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

struct pickerDropdown: View {
    let icon: String
    let items: [String]
    @State private var selectedIndex: Int = 0 
    let font: CGFloat
    let width: CGFloat
    let height: CGFloat
    let bgColor: String
    let bgTransparency: Double
    let fontColor: String
    let fontTransparency: Double
    let cornerRadius: CGFloat
    
    init(icon: String, items: [String], width: CGFloat, height: CGFloat, font: CGFloat, bgColor: String, bgTransparency: Double, fontColor: String, fontTransparency: Double, cornerRadius: CGFloat) {
        self.icon = icon
        self.items = items
        self.width = width
        self.height = height
        self.font = font
        self.bgColor = bgColor
        self.bgTransparency = bgTransparency
        self.fontColor = fontColor
        self.fontTransparency = fontTransparency
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        VStack {
            Menu {
                ForEach(0..<items.count, id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                    }) {
                        Text(items[index])
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Spacer()
                    Text(selectedAbbreviation)
                        .font(Font.system(size: font))
                        .foregroundColor(Color(hex: fontColor, transparency: fontTransparency))
                    Image(systemName: icon)
                        .font(.system(size: CGFloat(font), weight: .medium))
                        .foregroundColor(Color(hex: fontColor, transparency: fontTransparency))
                    Spacer()
                }
            }
            .frame(width: width, height: height)
            .accentColor(Color(hex: fontColor, transparency: fontTransparency))
            .background(Color(hex: bgColor, transparency: bgTransparency))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
        .frame(alignment: .center)
    }
    
    private var selectedAbbreviation: String {
        let selectedOption = items[selectedIndex]
        // Logic to get abbreviation from full name
        switch selectedOption {
            case "meter":
                return "m"
            case "centimeter":
                return "cm"
            case "feet":
                return "ft"
            case "inch":
                return "in"
            case "Rupiah":
                return "IDR"
            case "US Dollar":
                return "USD"
            case "Singaporean Dollar":
                return "SGD"
            case "Euro":
                return "EUR"
            default:
                return selectedOption
        }
    }
  }

#Preview {
    pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","c"], width: 57, height: 23, font: 12, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
}
