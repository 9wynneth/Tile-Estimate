//
//  popupResult.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 28/04/24.
//

import SwiftUI

struct popupResult: View {
    var areaLength: String
    var areaWidth: String
    var tileLength: String
    var tileWidth: String
    var tilesPerBox: String
    var pricePerBox: String
    var wastage: String
    
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
                    let tilesNeeded = calculateTilesNeeded(areaLength: Double(areaLength) ?? 0, areaWidth: Double(areaWidth) ?? 0, tileSizeArea: tileArea, wastage: Double(wastage) ?? 0)
                    let boxesNeeded = calculateBoxesNeeded(tilesNeeded: tilesNeeded, tilesPerBox: Double(tilesPerBox) ?? 0)
                    let totalCost = calculateTotalCost(boxesNeeded: boxesNeeded, pricePerBox: Double(pricePerBox) ?? 0)
                    
                    let tilesNeededNo = calculateTilesNeededNoWastage(areaLength: Double(areaLength) ?? 0, areaWidth: Double(areaWidth) ?? 0, tileSizeArea: tileArea, wastage: Double(wastage) ?? 0)
                    let boxesNeededNo = calculateBoxesNeeded(tilesNeeded: tilesNeededNo, tilesPerBox: Double(tilesPerBox) ?? 0)
                    let totalCostNo = calculateTotalCost(boxesNeeded: boxesNeededNo, pricePerBox: Double(pricePerBox) ?? 0)
                    
                    
                    
                    textBody17(text: "RESULT:").padding(.bottom,4)
                    HStack(spacing:18) {
                        textBody12(text: "TILE AREA: \(areaRoom) m2").fontWeight(.black)
                        textBody12(text: "TILE SIZE: \(tileLength)x\(tileWidth) cm").fontWeight(.black)
                    }
                    textSubHeadingGrouping(text: "if with wastage").padding(.top,8).padding(.trailing,110)
                    HStack(spacing:20) {
                        card(result: "\(tilesNeeded)", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                        card(result: "\(boxesNeeded)", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        card(result: "\(totalCost)", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
                    }
                    textSubHeadingGrouping(text: "if not with wastage").padding(.top,8).padding(.trailing,80)
                    HStack(spacing:20) {
                        card(result: "\(tilesNeededNo)", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                        card(result: "\(boxesNeededNo)", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        card(result: "\(totalCostNo)", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        button(icon: "square.and.arrow.up", text: "Share", width: 116, height: 44, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "4a382e", fontTransparency: 1.0, cornerRadius: 20)
                        button(icon: "square.and.arrow.down", text: "Save Image", width: 116, height: 44, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "4a382e", fontTransparency: 1.0, cornerRadius: 20)
                    }
                    Spacer()
                }
                Spacer()
            }.padding(.top,4)
            
        }
        .frame(width: 332, height: 690)
        .background(Color(hex: "C1ADA0", transparency: 0.95))
        .clipShape(RoundedRectangle(cornerRadius: 30))

    }
}

func calculateTileArea(length: Double, width: Double) -> Double {
    return length * width
}

func calculateTilesNeeded(areaLength: Double, areaWidth: Double, tileSizeArea: Double, wastage: Double) -> Int {
    let totalArea = areaLength * areaWidth
    let tilesNeeded = ceil(Double((totalArea * (1 + (wastage / 100))) / Double(tileSizeArea)))
    return Int(tilesNeeded)
}

func calculateTilesNeededNoWastage(areaLength: Double, areaWidth: Double, tileSizeArea: Double, wastage: Double) -> Int {
    let totalArea = areaLength * areaWidth
    let tilesNeeded = ceil(Double(totalArea) / Double(tileSizeArea))
    return Int(tilesNeeded)
}

func calculateBoxesNeeded(tilesNeeded: Int, tilesPerBox: Double) -> Int {
    let boxesNeeded = Int(ceil(Double(tilesNeeded) / tilesPerBox))
    return boxesNeeded
}

func calculateTotalCost(boxesNeeded: Int, pricePerBox: Double) -> Int {
    let totalCost = boxesNeeded * Int(pricePerBox)
    return totalCost
}

#Preview {
    popupResult(areaLength: "300", areaWidth: "300", tileLength: "40", tileWidth: "40", tilesPerBox: "6", pricePerBox: "60000", wastage: "5")
}
