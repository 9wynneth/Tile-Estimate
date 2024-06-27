import SwiftUI

struct pickerDropdown: View {
    let icon: String
    let items: [String]
    @State private var selectedIndex: Int = 0
    let font: CGFloat
    let width: CGFloat
    let height: CGFloat
    let bgColor: String
    let bgTransparency: (light: Double, dark: Double)
    let fontColor: String
    let fontTransparency: (light: Double, dark: Double)
    let cornerRadius: CGFloat
    @Binding var transfer: String
    
    init(icon: String, items: [String], font: CGFloat, width: CGFloat, height: CGFloat, bgColor: String, bgTransparency: Any, fontColor: String, fontTransparency: Any, cornerRadius: CGFloat, transfer: Binding<String>) {
        self.icon = icon
        self.items = items
        self.font = font
        self.width = width
        self.height = height
        self.bgColor = bgColor
        self.bgTransparency = parseTransparency(bgTransparency)
        self.fontColor = fontColor
        self.fontTransparency = parseTransparency(fontTransparency)
        self.cornerRadius = cornerRadius
        self._transfer = transfer
    }
    
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
                        .foregroundColor(Color(hex: fontColor, transparency: currentTransparency(for: fontTransparency)))
                    Image(systemName: icon)
                        .font(.system(size: CGFloat(font), weight: .medium))
                        .foregroundColor(Color(hex: fontColor, transparency: currentTransparency(for: fontTransparency)))
                    Spacer()
                }
            }
            .frame(width: width, height: height)
            .accentColor(Color(hex: fontColor, transparency: currentTransparency(for: fontTransparency)))
            .background(Color(hex: bgColor, transparency: currentTransparency(for: bgTransparency)))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
        .frame(alignment: .center)
    }
    
    var selectedAbbreviation: String {
        let selectedOption = items[selectedIndex]
        
        switch selectedOption {
        case "Rectangle":
            transfer = "Rectangle"
            return "Rectangle"
        case "Circle":
            transfer = "Circle"
            return "Circle"
        case "Triangle":
            transfer = "Triangle"
            return "Triangle"
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
        case "square meter":
            transfer = "m2"
            return "m2"
        case "square centimeter":
            transfer = "cm2"
            return "cm2"
        case "square feet":
            transfer = "ft2"
            return "ft2"
        case "square inch":
            transfer = "in2"
            return "in2"
        default:
            transfer = selectedOption
            return selectedOption
        }
    }
    
    func currentTransparency(for transparency: (light: Double, dark: Double)) -> Double {
        return UITraitCollection.current.userInterfaceStyle == .dark ? transparency.dark : transparency.light
    }
}

func parseTransparency(_ transparency: Any) -> (light: Double, dark: Double) {
    if let transparency = transparency as? Double {
        return (light: transparency, dark: transparency)
    } else if let transparency = transparency as? String {
        let values = transparency.split(separator: ":").map { Double($0.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 1.0 }
        let lightTransparency = values.first ?? 1.0
        let darkTransparency = values.count > 1 ? values[1] : lightTransparency
        return (light: lightTransparency, dark: darkTransparency)
    } else {
        return (light: 1.0, dark: 1.0)
    }
}
