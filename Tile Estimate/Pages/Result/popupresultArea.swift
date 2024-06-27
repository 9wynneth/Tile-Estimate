//
//  popupresultArea.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 04/05/24.
//

import SwiftUI
import UIKit

struct popupresultArea: View {
    var area: String
    var tileLength2: String
    var tileWidth2: String
    var tilesPerBox2: String
    var pricePerBox2: String
    var wastage2: String
    
    @Binding var selectedAbbrePrice: String
    @Binding var selectedAbbrevArea: String
    @Binding var selectedAbbrevTile: String
    
    @Binding var showResult: Bool
    @EnvironmentObject var historyManager: HistoryManager

    
    init(area: String, tileLength2: String, tileWidth2: String, tilesPerBox2: String, pricePerBox2: String, wastage2: String, selectedAbbrePrice: Binding<String>, selectedAbbrevArea: Binding<String> = .constant("m2"), selectedAbbrevTile: Binding<String>, showResult: Binding<Bool>) {
            self.area = area
            self.tileLength2 = tileLength2
            self.tileWidth2 = tileWidth2
            self.tilesPerBox2 = tilesPerBox2
            self.pricePerBox2 = pricePerBox2
            self.wastage2 = wastage2
            self._selectedAbbrePrice = selectedAbbrePrice
            self._selectedAbbrevArea = selectedAbbrevArea
            self._selectedAbbrevTile = selectedAbbrevTile
            self._showResult = showResult
        }
    

    var body: some View {
        
        VStack {
            VStack(spacing:0) {
                HStack {
                    Spacer()
                    button(icon: "", text:"X", width: 30, height:30, font: 15, bgColor: "946F5A", bgTransparency: 0.5 , fontColor:"3D3D3D", fontTransparency: 0.7, cornerRadius: 20)
                    {
                        showResult.toggle()
                    }
                }.padding(.horizontal,4).padding(.top,8).padding(.trailing,8)
                VStack(spacing: 8) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 70)
                    
                }.padding(.bottom,8)

                
                let tilesNeeded2 = calculateTilesNeededInches(area: Double(area) ?? 0,
                                                             tileLength: Double(tileLength2) ?? 0,
                                                             tileWidth: Double(tileWidth2) ?? 0,
                                                             selectedAbbrevArea: selectedAbbrevArea,
                                                             selectedAbbrevTile: selectedAbbrevTile,
                                                             wastage: Double(wastage2) ?? 0)
                
                let boxesNeeded2 = calculateBoxesNeeded2(tilesNeeded: Int(tilesNeeded2), tilesPerBox: Double(tilesPerBox2) ?? 0)
                let totalCost = calculateTotalCost2(boxesNeeded: Int(boxesNeeded2), pricePerBox: Double(pricePerBox2) ?? 0)
                
                let tilesNeededNo = calculateTilesNeededInchesNoWastage(area: Double(area) ?? 0,
                                                                        tileLength: Double(tileLength2) ?? 0,
                                                                        tileWidth: Double(tileWidth2) ?? 0,
                                                                        selectedAbbrevArea: selectedAbbrevArea,
                                                                        selectedAbbrevTile: selectedAbbrevTile)
                let boxesNeededNo = calculateBoxesNeeded2(tilesNeeded: Int(tilesNeededNo), tilesPerBox: Double(tilesPerBox2) ?? 0)
                let totalCostNo = calculateTotalCost2(boxesNeeded: Int(boxesNeededNo), pricePerBox: Double(pricePerBox2) ?? 0)
                
                
                textBody17(text: "RESULT:").padding(.bottom,4)
                HStack(spacing:18) {
                    textBody12(text: "TILE AREA: \(Double(area) ?? 0) \(selectedAbbrevArea)").fontWeight(.black)
                    textBody12(text: "TILE SIZE: \(tileLength2)x\(tileWidth2) \(selectedAbbrevTile)").fontWeight(.black)
                }
                textSubHeadingGrouping(text: "if with \(wastage2)% wastage").padding(.top,8).padding(.leading,-100)
                HStack(spacing:20) {
                    card(result: "\(tilesNeeded2)", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                    card(result: "\(boxesNeeded2)", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                }
                HStack {
                    card(result: "\(selectedAbbrePrice). \(formattedCost2(totalCost))", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
                }
                textSubHeadingGrouping(text: "if not with wastage").padding(.top,8).padding(.leading,-100)
                HStack(spacing:20) {
                    card(result: "\(tilesNeededNo)", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                    card(result: "\(boxesNeededNo)", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                }
                HStack {
                    card(result: "\(selectedAbbrePrice). \(formattedCost2(totalCostNo))", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
                }
                HStack {
                    button(icon: "square.and.arrow.up", text: "Share", width: 116, height: 44, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "4a382e", fontTransparency: 1.0, cornerRadius: 20)
                    {
                        shareButtonClicked2(area: area, tileLength: tileLength2, tileWidth: tileWidth2, tilesNeeded2: Int(tilesNeeded2), tilesNeededNo: Int(tilesNeededNo), boxesNeeded2: Int(boxesNeeded2), boxesNeededNo: Int(boxesNeededNo), totalCost: totalCost, totalCostNo: totalCostNo, wastage: wastage2, selectedAbbrevArea: selectedAbbrevArea, selectedAbbrevTile: selectedAbbrevTile, selectedAbbrevPrice: selectedAbbrePrice)
                    }
                    button(icon: "square.and.arrow.down", text: "Save", width: 116, height: 44, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "4a382e", fontTransparency: 1.0, cornerRadius: 20){
                        let newEntry = history(area: area, tileLength: tileLength2, tileWidth: tileWidth2, tilesNeeded: String(tilesNeeded2), boxNeeded: String(boxesNeeded2), cost: String(formattedCost(totalCost)), tilesNeededNo: String(tilesNeededNo), boxNeededNo: String(boxesNeededNo), costNo: String(formattedCost(totalCostNo)), selectedArea: selectedAbbrevArea, selectedTile: selectedAbbrevTile, selectedCost: selectedAbbrePrice, wastage: wastage2, selectedShape: "")
                        historyManager.historyEntries.append(newEntry)
                        showResult.toggle()
                        
                    }
                }.padding(.top,8)
                Spacer()
                
                Spacer()
            }.padding(.top,4)
        }
        
        .frame(width: 332, height: 620)
        .background(Color(hex: "C1ADA0", transparency: 0.95))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .onAppear {
            print(selectedAbbrePrice)
            print(selectedAbbrevArea)
            print(selectedAbbrevTile)
            print(area)
            print(tileWidth2)
            print(tilesPerBox2)
            print(calculateBoxesNeeded2(tilesNeeded: 50, tilesPerBox: 5.0))
            print(wastage2)
            print(calculateBoxesNeeded2(tilesNeeded: 100, tilesPerBox: 50))
            print(calculateTilesNeededInches(area: 9.0, tileLength: 40, tileWidth: 40, selectedAbbrevArea: "m2", selectedAbbrevTile: "cm", wastage: 100))
        }
        
    }
}
func formattedCost2(_ cost: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: cost)) ?? ""
}


private func convertToInches(value: Double, unit: String) -> Double {
    switch unit {
    case "m":
        return value * 39.3701
    case "ft":
        return value * 12.0
    case "cm":
        return value * 0.393701
    case "in":
        return value
    case "m2":
        return value * 1550.0031
    case "ft2":
        return value * 144.0
    case "cm2":
        return value * 0.155
    case "in2":
        return value
    default:
        return 0.0
    }
}

func calculateTilesNeededInches(area: Double, tileLength: Double, tileWidth: Double, selectedAbbrevArea: String, selectedAbbrevTile: String, wastage: Double) -> Int {
    let areaInInches = convertToInches(value: area, unit: selectedAbbrevArea) * (1 + (wastage / 100))
    
    let tileLengthInInches = convertToInches(value: tileLength, unit: selectedAbbrevTile)
    let tileWidthInInches = convertToInches(value: tileWidth, unit: selectedAbbrevTile)
    
    let tileAreaInSquareInches = tileLengthInInches * tileWidthInInches
    
    let tilesNeeded = ceil(Double(areaInInches) / Double(tileAreaInSquareInches))
    
    return Int(ceil(tilesNeeded))

}

func calculateTilesNeededInchesNoWastage(area: Double, tileLength: Double, tileWidth: Double, selectedAbbrevArea: String, selectedAbbrevTile: String) -> Int {
    var areaInInches = convertToInches(value: area, unit: selectedAbbrevArea)
    
    let tileLengthInInches = convertToInches(value: tileLength, unit: selectedAbbrevTile)
    let tileWidthInInches = convertToInches(value: tileWidth, unit: selectedAbbrevTile)
    
    let tileAreaInSquareInches = tileLengthInInches * tileWidthInInches
    
    let tilesNeeded = ceil(Double(areaInInches) / Double(tileAreaInSquareInches))
    
    return Int(ceil(tilesNeeded))

}

func calculateTileArea2(length: Double, width: Double) -> Double {
    return length * width
}

func calculateBoxesNeeded2(tilesNeeded: Int, tilesPerBox: Double) -> Int {
    let boxesNeeded2 = ceil(Double(tilesNeeded) / tilesPerBox)
    return Int(boxesNeeded2)
}

func calculateTotalCost2 (boxesNeeded: Int, pricePerBox: Double) -> Int {
    let totalCost2 = boxesNeeded * Int(pricePerBox)
    return Int(totalCost2)
}

func shareButtonClicked2(area: String, tileLength: String, tileWidth: String, tilesNeeded2: Int, tilesNeededNo: Int, boxesNeeded2
                         : Int, boxesNeededNo: Int, totalCost: Int, totalCostNo: Int, wastage: String, selectedAbbrevArea: String, selectedAbbrevTile: String, selectedAbbrevPrice: String) {
    let textToShare = """
        
        Area to be cover in \(selectedAbbrevArea)2 = \(area) \(selectedAbbrevArea)2
        
        Tile Length = \(tileLength) \(selectedAbbrevTile)
        Tile Width = \(tileWidth) \(selectedAbbrevTile)
        
        Per box price = \(totalCost)
        
        if with \(wastage)% wastage
        Total tiles will use = \(tilesNeeded2) Tiles
        Total boxes will use = \(boxesNeeded2) Box
        Cost estimated = \(selectedAbbrevPrice). \(totalCost)
        
        if not with wastage
        Total tiles will use = \(tilesNeededNo) Tiles
        Total boxes will use = \(boxesNeededNo) Box
        Cost estimated = \(selectedAbbrevPrice). \(totalCostNo)
        """
    
    if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
        let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        window.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}
