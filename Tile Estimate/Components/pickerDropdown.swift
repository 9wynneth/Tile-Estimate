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
    @Binding var transfer : String
    
    var body: some View {
        VStack {
            Menu {
                ForEach(0..<items.count, id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                        transfer = selectedAbbreviation
                    }) {
                        
                        Text(items[index])
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Spacer()
                    Text(transfer.isEmpty ? selectedAbbreviation : transfer)
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
    
    var selectedAbbreviation: String {
        let selectedOption = items[selectedIndex]
        
        switch selectedOption {
        case "meter":
            transfer = "m"
            return "m"
        case "centimeter":
            transfer = "cm"
            return "cm"
        case "feet":
            transfer = "ft"
            return "ft"
        case "inch":
            transfer = "in"
            return "in"
        case "Rupiah":
            transfer = "IDR"
            return "IDR"
        case "US Dollar":
            transfer = "USD"
            return "USD"
        case "Singaporean Dollar":
            transfer = "SGD"
            return "SGD"
        case "Euro":
            transfer = "EUR"
            return "EUR"
        default:
            transfer = selectedOption
            return selectedOption
            
        }
    }
    
    
    
    
}

//#Preview {
//    pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","c"], width: 57, height: 23, font: 12, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: "cm")
//}
