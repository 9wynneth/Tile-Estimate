//
//  sheetCalculateArea.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 28/04/24.
//

import SwiftUI

struct sheetCalculateArea: View {
    @State private var area = ""
    @State private var length = ""
    @State private var width2 = ""
    @State private var tilesPerBox2 = ""
    @State private var pricePerBox2 = ""
    @State private var wastage2 = ""
    
    @State private var selectedArea = "m2"
    @State private var selectedAbreLength = "m"
    @State private var selectedAbreWidth = "m"
    @State private var selectedPrice = "IDR"
    
    
    
    
    @Binding var showPopup:Bool
    @State private var showResult = false
    @State private var alert = false

    
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                ZStack {
                    VStack {
                        if alert {
                            CustomAlert(
                                title: "Are you sure?",
                                description: "By clicking 'Clear', all data you have entered will be permanently deleted.",
                                cancelAction: {
                                    alert = false
                                },
                                cancelActionTitle: "Cancel",
                                primaryAction: {
                                    area = ""
                                    length = ""
                                    width2 = ""
                                    tilesPerBox2 = ""
                                    pricePerBox2 = ""
                                    wastage2 = ""
                                    alert = false
                                    
                                },
                                primaryActionTitle: "Clear"
                            ).cornerRadius(14)
                        }
                    }.zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).ignoresSafeArea()
                    VStack {
                        if showResult {
                            
                            popupresultArea(area: area, tileLength2: length, tileWidth2: width2, tilesPerBox2: tilesPerBox2, pricePerBox2: pricePerBox2, wastage2: wastage2, selectedAbbrePrice: $selectedPrice, selectedAbbrevArea: $selectedArea, selectedAbbrevTile: $selectedAbreLength, showResult: $showResult)
                        }
                    }.zIndex(1.0)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 0.9490196108818054, green: 0.9333333373069763, blue: 0.9215686321258545, alpha: 1)))
                        .frame(width: .infinity, height: 700)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05000000074505806)), radius:100, x:0, y:0)
                    VStack {
                        HStack {
                            textHeading(text: "Calculation With Area").padding(.trailing, 10)
                            Spacer()
                            button(icon: "", text:"X", width: 30, height:30, font: 15, bgColor: "ded4cd", bgTransparency: 1.0 , fontColor:"7F7F7F", fontTransparency: 0.5, cornerRadius: 20){
                                showPopup = false
                            }
                        }.padding(.horizontal,12).padding(.top,8)
                        
                        VStack {
                            HStack {
                                textSubHeadingGrouping(text: "area to cover")
                                Spacer()
                            }.padding(.horizontal,25).padding(.top,16)
                            
                            VStack (spacing:0){
                                ZStack {
                                    UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
                                        .fill(Color(hex: "ffffff", transparency: 0.7))
                                        .frame(width: .infinity, height: 44)
                                        .padding(.horizontal,25).padding(.top,4)
                                    
                                    HStack {
                                        textBody17(text: "Area")
                                        Spacer()
                                        textfieldInput(text: $area, placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                            .keyboardType(.numberPad)
                                        
                                        pickerDropdown(icon: "chevron.up.chevron.down", items: ["square meter", "square centimeter","square feet", "square inch"], font: 12, width: 62, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedArea)
                                        
                                    }
                                    .padding(.horizontal,45).padding(.top,2)
                                    
                                }.padding(.top,5)
                                    .frame(alignment: .center)
                                
                                
                                HStack {
                                    textSubHeadingGrouping(text: "tile size")
                                    Spacer()
                                }.padding(.horizontal,25).padding(.top,20)
                                
                                VStack (spacing:0){
                                    ZStack {
                                        
                                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 10, style: .continuous)
                                            .fill(Color(hex: "ffffff", transparency: 0.7))
                                            .frame(width: .infinity, height: 44)
                                            .padding(.horizontal,25).padding(.top,4)
                                        
                                        HStack {
                                            textBody17(text: "Length")
                                            Spacer()
                                            textfieldInput(text: $length, placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                .keyboardType(.numberPad)
                                            
                                            pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], font: 12, width: 57, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedAbreLength)
                                                .onChange(of: selectedAbreLength) { newValue in
                                                    selectedAbreWidth = newValue
                                                }
                                        }
                                        .padding(.horizontal,45).padding(.top,12)
                                        
                                    }.padding(.top,5)
                                        .frame(alignment: .center)
                                    
                                    ZStack {
                                        UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 0, style: .continuous)
                                            .fill(Color(hex: "ffffff", transparency: 0.7))
                                            .frame(width: .infinity, height: 44)
                                            .padding(.horizontal,25)
                                        HStack {
                                            textBody17(text: "Width")
                                            Spacer()
                                            
                                            textfieldInput(text: $width2, placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                .keyboardType(.numberPad)
                                            
                                            pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], font: 12, width: 57, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedAbreWidth)
                                                .onChange(of: selectedAbreWidth) { newValue in
                                                    selectedAbreLength = newValue
                                                }
                                        }
                                        .padding(.horizontal,45)
                                    }
                                    .frame(alignment: .center)
                                    
                                    HStack {
                                        textSubHeadingGrouping(text: "what you want to buy")
                                        Spacer()
                                    }.padding(.horizontal,25).padding(.top,20)
                                    
                                    VStack(spacing:8) {
                                        ZStack {
                                            UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
                                                .fill(Color(hex: "ffffff", transparency: 0.7))
                                                .frame(width: .infinity, height: 44)
                                                .padding(.horizontal,25)
                                            HStack {
                                                textBody17(text: "Tiles per box")
                                                Spacer()
                                                
                                                textfieldInput(text:$tilesPerBox2, placeholder: "6", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                    .keyboardType(.numberPad)
                                            }
                                            .padding(.horizontal,45)
                                        }
                                        
                                        ZStack {
                                            UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
                                                .fill(Color(hex: "ffffff", transparency: 0.7))
                                                .frame(width: .infinity, height: 44)
                                                .padding(.horizontal,25)
                                            HStack {
                                                textBody17(text: "Price")
                                                Spacer()
                                                
                                                pickerDropdown(icon: "chevron.up.chevron.down", items: ["IDR", "EUR","SGD", "USD"], font: 12, width: 65, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedPrice)
                                                
                                                textfieldInput(text: $pricePerBox2,placeholder: "60000", font: 17, width: 130, height: 32, cornerRadius: 8, satuan: "/ box")
                                                    .keyboardType(.numberPad)
                                            }
                                            .padding(.horizontal,45)
                                        }
                                        
                                        ZStack {
                                            UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
                                                .fill(Color(hex: "ffffff", transparency: 0.7))
                                                .frame(width: .infinity, height: 44)
                                                .padding(.horizontal,25)
                                            HStack {
                                                textBody17(text: "Wastage")
                                                Spacer()
                                                
                                                textfieldInput(text:$wastage2 ,placeholder: "5", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "%")
                                                    .keyboardType(.numberPad)
                                                
                                            }
                                            .padding(.horizontal,45)
                                        }
                                        
                                        
                                    }.padding(.top,5)
                                        .frame(alignment: .center)
                                    
                                    VStack(spacing:8) {
                                        button(icon: "", text: "Calculate", width: 335, height: 49, font: 15, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
                                        {
                                            showResult = true
                                        }
                                        
                                        button(icon: "", text: "Clear All", width: 335, height: 49, font: 15, bgColor: "ded4cd", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20){
                                            alert = true

                                        }
                                        
                                    }.padding(.top,40)
                                    
                                }
                                Spacer()
                            }
                            
                            Spacer()
                            
                        }
                        
                        Spacer()
                    }
                    
                    
                }
            }
        }.ignoresSafeArea()
        .background(Color(hex: "F2EEEB", transparency: 1.0))
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
    }
}
//
//#Preview {
//    sheetCalculateArea(showPopup: true)
//}
