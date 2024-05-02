//
//  QuickCount.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 27/04/24.
//

import SwiftUI

struct QuickCount: View {
    @State private var areaLength = ""
    @State private var areaWidth = ""
    @State private var tileLength = ""
    @State private var tileWidth = ""
    @State private var tilesPerBox = ""
    @State private var pricePerBox = ""
    @State private var wastage = ""
    @State private var showPopup = false


    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Spacer()
                    VStack {
                        if showPopup {
                            popupResult(areaLength: areaLength, areaWidth: areaWidth, tileLength: tileLength, tileWidth: tileWidth, tilesPerBox: tilesPerBox, pricePerBox: pricePerBox, wastage: wastage)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 100)
                        }
                    }
                    .zIndex(1)
                    
                    ScrollView {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "c1ada0", transparency: 1.0))
                                .frame(width: .infinity, height: 130)
                            
                            textHeadingFitur(text: "Quick Count")
                                .padding(.top,65)
                        }
                        Spacer()
                        
                        VStack {
                            HStack {
                                textBody12(text: "area to cover")
                                Spacer()
                                Text("Already know the area of the room?")
                                    .font(.custom("Inter Bold", size: 11))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex:"946F5A", transparency: 1.0))
                                    .underline()
                            }.padding(.horizontal,25).padding(.top,16)
                            
                            VStack (spacing:0){
                                ZStack {
                                    UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 10, style: .continuous)
                                        .fill(Color(hex: "ffffff", transparency: 0.7))
                                        .frame(width: .infinity, height: 44)
                                        .padding(.horizontal,25).padding(.top,4)
                                    
                                    HStack {
                                        textBody17(text: "Shape")
                                        Spacer()
                                        pickerDropdown(icon: "chevron.up.chevron.down", items: ["Rectangle", "Circle","Triangle"], width: 140, height: 23, font: 12, bgColor: "946F5A", bgTransparency: 0.1, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
                                    }
                                    .padding(.horizontal,45).padding(.top,12)
                                    
                                }.padding(.top,5)
                                    .frame(alignment: .center)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 0)
                                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.699999988079071)))
                                        .frame(width: .infinity, height: 44)
                                        .padding(.horizontal,25)
                                    HStack {
                                        textBody17(text: "Length")
                                        Spacer()
                                        
                                        textfieldInput(text: $areaLength, placeholder: "3", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                            .keyboardType(.numberPad)
                                        
                                        pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], width: 57, height: 23, font: 12, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
                                    }
                                    .padding(.horizontal,45)
                                }
                                .frame(alignment: .center)
                                
                                ZStack {
                                    UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 0, style: .continuous)
                                        .fill(Color(hex: "ffffff", transparency: 0.7))
                                        .frame(width: .infinity, height: 44)
                                        .padding(.horizontal,25)
                                    HStack {
                                        textBody17(text: "Width")
                                        Spacer()
                                        
                                        textfieldInput(text:$areaWidth, placeholder: "3", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                            .keyboardType(.numberPad)
                                        pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], width: 57, height: 23, font: 12, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
                                        
                                    }
                                    .padding(.horizontal,45)
                                }
                                .frame(alignment: .center)
                                
                                HStack {
                                    textBody12(text: "tile size")
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
                                            textfieldInput(text:$tileLength, placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                .keyboardType(.numberPad)
                                            
                                            pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], width: 57, height: 23, font: 12, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
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
                                            
                                            textfieldInput(text:$tileWidth ,placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                .keyboardType(.numberPad)
                                            
                                            pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], width: 57, height: 23, font: 12, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
                                        }
                                        .padding(.horizontal,45)
                                    }
                                    .frame(alignment: .center)
                                    
                                    HStack {
                                        textBody12(text: "what you want to buy")
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
                                                
                                                textfieldInput(text:$tilesPerBox, placeholder: "6", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
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
                                                
                                                pickerDropdown(icon: "chevron.up.chevron.down", items: ["Rupiah", "Euro","US Dollar", "Singaporean Dollar"], width: 60, height: 23, font: 10, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
                                                
                                                textfieldInput(text:$pricePerBox, placeholder: "60000", font: 17, width: 127, height: 32, cornerRadius: 8, satuan: "")
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
                                                
                                                textfieldInput(text:$wastage, placeholder: "5", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "%")
                                                    .keyboardType(.numberPad)
                                                
                                            }
                                            .padding(.horizontal,45)
                                        }
                                        
                                        
                                    }.padding(.top,5)
                                        .frame(alignment: .center)
                                    
                                    VStack(spacing:8) {
                                        button(icon: "", text: "Calculate", width: 335, height: 49, font: 15, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20) {
                                            showPopup.toggle()
                                            
                                        }
                                        
                                        
                                        button(icon: "", text: "Clear All", width: 335, height: 49, font: 15, bgColor: "ded4cd", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
                                        
                                    }.padding(.top,32)
                                    
                                }
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        
                        
                    }
                }
                .ignoresSafeArea()
                .background(Color(hex: "F2EEEB", transparency: 1.0))
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    showPopup = false

                }
            }
            
        }
    }
}

#Preview {
    QuickCount()
}
