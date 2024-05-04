//
//  popupResult.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 28/04/24.
//

import SwiftUI
import UIKit

struct popupResult: View {
    var areaLength: String
    var areaWidth: String
    var tileLength: String
    var tileWidth: String
    var tilesPerBox: String
    var pricePerBox: String
    var wastage: String
    var areaUnitIndex: Int
    
    @Binding var selectedAbbrePrice: String
    @Binding var selectedAbbrevArea: String
    @Binding var selectedAbbrevTile: String
    
    
    
    var body: some View {
        VStack {
            VStack(spacing:0) {
                VStack(spacing: 8) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 70)
                    
                    Text("TILE ESTIMATE")
                        .font(.custom("Inter Extra Bold", size: 20))
                        .tracking(3.96)
                        .lineSpacing(20)
                        .transition(.move(edge: .leading))
                    
                }
                Text("COUNT TILES, PLAN SMARTER")
                    .font(.custom("Inter Extra Bold", size: 12))
                    .foregroundColor(Color(#colorLiteral(red: 0.58, green: 0.44, blue: 0.35, alpha: 1)))
                    .tracking(3.96)
                    .lineSpacing(20)
                    .transition(.move(edge: .leading))
                    .padding(.top, 0)
                Spacer()
                VStack {
                    let areaRoom = calculateTileArea(length: Double(areaLength) ?? 0, width: Double(areaWidth) ?? 0)
                    let tileArea = calculateTileArea(length: Double(tileLength) ?? 0, width: Double(tileWidth) ?? 0)
                    let tilesNeeded = calculateTilesNeededInches(areaLength: Double(areaLength) ?? 0,
                                                                 areaWidth: Double(areaWidth) ?? 0,
                                                                 tileLength: Double(tileLength) ?? 0,
                                                                 tileWidth: Double(tileWidth) ?? 0,
                                                                 selectedAbbrevArea: selectedAbbrevArea,
                                                                 selectedAbbrevTile: selectedAbbrevTile,
                                                                 wastage: Double(wastage) ?? 0)
                    
                    let boxesNeeded = calculateBoxesNeeded(tilesNeeded: Int(tilesNeeded), tilesPerBox: Double(tilesPerBox) ?? 0)
                    let totalCost = calculateTotalCost(boxesNeeded: boxesNeeded, pricePerBox: Double(pricePerBox) ?? 0)
                    
                    let tilesNeededNo = calculateTilesNeededInchesNoWastage(areaLength: Double(areaLength) ?? 0,
                                                                   areaWidth: Double(areaWidth) ?? 0,
                                                                   tileLength: Double(tileLength) ?? 0,
                                                                   tileWidth: Double(tileWidth) ?? 0,
                                                                   selectedAbbrevArea: selectedAbbrevArea,
                                                                   selectedAbbrevTile: selectedAbbrevTile)
                    let boxesNeededNo = calculateBoxesNeeded(tilesNeeded: Int(tilesNeededNo), tilesPerBox: Double(tilesPerBox) ?? 0)
                    let totalCostNo = calculateTotalCost(boxesNeeded: boxesNeededNo, pricePerBox: Double(pricePerBox) ?? 0)
                    
                
                    textBody17(text: "RESULT:").padding(.bottom,4)
                    HStack(spacing:18) {
                        textBody12(text: "TILE AREA: \(areaRoom) \(selectedAbbrevArea)2").fontWeight(.black)
                        textBody12(text: "TILE SIZE: \(tileLength)x\(tileWidth) \(selectedAbbrevTile)").fontWeight(.black)
                    }
                    textSubHeadingGrouping(text: "if with \(wastage)% wastage").padding(.top,8).padding(.leading,-100)
                    HStack(spacing:20) {
                        card(result: "\(tilesNeeded)", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                        card(result: "\(boxesNeeded)", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        card(result: "\(selectedAbbrePrice). \(totalCost)", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
                    }
                    textSubHeadingGrouping(text: "if not with wastage").padding(.top,8).padding(.leading,-100)
                    HStack(spacing:20) {
                        card(result: "\(tilesNeededNo)", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                        card(result: "\(boxesNeededNo)", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        card(result: "\(selectedAbbrePrice). \(totalCostNo)", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        button(icon: "square.and.arrow.up", text: "Share", width: 116, height: 44, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "4a382e", fontTransparency: 1.0, cornerRadius: 20)
                        {
                            shareButtonClicked(areaLength: areaLength, areaWidth: areaWidth, tileLength: tileLength, tileWidth: tileWidth, tilesNeeded: Int(tilesNeeded), tilesNeededNo: Int(tilesNeededNo), boxesNeeded: boxesNeeded, boxesNeededNo: boxesNeededNo, totalCost: totalCost, totalCostNo: totalCostNo, wastage: wastage, selectedAbbrevArea: selectedAbbrevArea, selectedAbbrevTile: selectedAbbrevTile, selectedAbbrevPrice: selectedAbbrePrice)
                        }
                        button(icon: "square.and.arrow.down", text: "Save Image", width: 116, height: 44, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "4a382e", fontTransparency: 1.0, cornerRadius: 20)
                    }
                    Spacer()
                }
                Spacer()
            }.padding(.top,4)
                .onAppear {
                    print(selectedAbbrevArea)
                    print(selectedAbbrevTile)
                }

        }

        .frame(width: 332, height: 690)
        .background(Color(hex: "C1ADA0", transparency: 0.95))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        
    }
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
    default:
        return 0.0
    }
}

func calculateTilesNeededInches(areaLength: Double, areaWidth: Double, tileLength: Double, tileWidth: Double, selectedAbbrevArea: String, selectedAbbrevTile: String, wastage: Double) -> Int {
    let areaLengthInInches = convertToInches(value: areaLength, unit: selectedAbbrevArea)
    let areaWidthInInches = convertToInches(value: areaWidth, unit: selectedAbbrevArea)
    
    let tileLengthInInches = convertToInches(value: tileLength, unit: selectedAbbrevTile)
    let tileWidthInInches = convertToInches(value: tileWidth, unit: selectedAbbrevTile)
    
    let totalAreaInSquareInches = areaLengthInInches * areaWidthInInches * (1 + (wastage / 100))
    
    let tileAreaInSquareInches = tileLengthInInches * tileWidthInInches
    
    let tilesNeeded = ceil(Double(totalAreaInSquareInches) / Double(tileAreaInSquareInches))
    
    return Int(tilesNeeded)
}

func calculateTilesNeededInchesNoWastage(areaLength: Double, areaWidth: Double, tileLength: Double, tileWidth: Double, selectedAbbrevArea: String, selectedAbbrevTile: String) -> Int {
    // Convert area length and width to inches
    let areaLengthInInches = convertToInches(value: areaLength, unit: selectedAbbrevArea)
    let areaWidthInInches = convertToInches(value: areaWidth, unit: selectedAbbrevArea)
    
    // Convert tile length and width to inches
    let tileLengthInInches = convertToInches(value: tileLength, unit: selectedAbbrevTile)
    let tileWidthInInches = convertToInches(value: tileWidth, unit: selectedAbbrevTile)
    
    // Calculate total area in square inches
    let totalAreaInSquareInches = areaLengthInInches * areaWidthInInches
    
    // Calculate tile area in square inches
    let tileAreaInSquareInches = tileLengthInInches * tileWidthInInches
    
    // Calculate tiles needed
    let tilesNeeded = (ceil(totalAreaInSquareInches / tileAreaInSquareInches))
    
    return Int(tilesNeeded)
}

func calculateTileArea(length: Double, width: Double) -> Double {
    return length * width
}

func calculateBoxesNeeded(tilesNeeded: Int, tilesPerBox: Double) -> Int {
    let boxesNeeded = Int(ceil(Double(tilesNeeded) / tilesPerBox))
    return boxesNeeded
}

func calculateTotalCost(boxesNeeded: Int, pricePerBox: Double) -> Int {
    let totalCost = boxesNeeded * Int(pricePerBox)
    return totalCost
}

func shareButtonClicked(areaLength: String, areaWidth: String, tileLength: String, tileWidth: String, tilesNeeded: Int, tilesNeededNo: Int, boxesNeeded: Int, boxesNeededNo: Int, totalCost: Int, totalCostNo: Int, wastage: String, selectedAbbrevArea: String, selectedAbbrevTile: String, selectedAbbrevPrice: String) {
    let textToShare = """
    Area Length = \(areaLength) \(selectedAbbrevArea)
    Area Width = \(areaWidth) \(selectedAbbrevArea)
    
    Area to be cover in m² = \(Double(areaLength)! * Double(areaWidth)!) m²
    
    Tile Length = \(tileLength) \(selectedAbbrevTile)
    Tile Width = \(tileWidth) \(selectedAbbrevTile)
    
    Per box price = \(totalCost)
    
    if with \(wastage)% wastage
    Total tiles will use = \(tilesNeeded) Tiles
    Total boxes will use = \(boxesNeeded) Box
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



//#Preview {
//    popupResult(areaLength: "300", areaWidth: "300", tileLength: "40", tileWidth: "40", tilesPerBox: "6", pricePerBox: "60000", wastage: "5")
//}
