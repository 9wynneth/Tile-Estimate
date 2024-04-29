//
//  popupResult.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 28/04/24.
//

import SwiftUI

struct popupResult: View {
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
                    textBody17(text: "RESULT:").padding(.bottom,4)
                    HStack(spacing:18) {
                        textBody12(text: "TILE AREA: 9m2").fontWeight(.black)
                        textBody12(text: "TILE SIZE: 40x40 cm").fontWeight(.black)
                    }
                    textSubHeadingGrouping(text: "if with wastage").padding(.top,8).padding(.trailing,110)
                    HStack(spacing:20) {
                        card(result: "40", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                        card(result: "40", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        card(result: "IDR.6000000", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
                    }
                    textSubHeadingGrouping(text: "if not with wastage").padding(.top,8).padding(.trailing,80)
                    HStack(spacing:20) {
                        card(result: "40", label: "Tiles Needed", width: 90, height: 75, cornerRadius: 15)
                        card(result: "40", label: "Box Needed", width: 90, height: 75, cornerRadius: 15)
                    }
                    HStack {
                        card(result: "IDR.6000000", label: "Cost Estimated", width: 211, height: 75, cornerRadius: 15)
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

#Preview {
    popupResult()
}
