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
    @State private var areaUnitIndex = 0
    @State private var tileUnitIndex = 0
    @State private var selectedAbrePrice=""
    @State private var showSheetArea = false
    @State private var alert = false
    
    
    
    @State private var selectedShape = ""
    
    @State private var selectedAbreLengthArea = ""
    @State private var selectedAbreWidthArea = ""
    @State private var selectedAbreLengthTile = ""
    @State private var selectedAbreWidthTile = ""
    
    var body: some View {
        let historyManager = HistoryManager()

        GeometryReader { geometry in
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
                                areaUnitIndex = 0
                                tileUnitIndex = 1
                                areaLength = ""
                                areaWidth = ""
                                tileLength = ""
                                tileWidth = ""
                                tilesPerBox = ""
                                pricePerBox = ""
                                wastage = ""
                                alert = false
                                
                            },
                            primaryActionTitle: "Clear"
                        ).cornerRadius(14)
                    }

                }.zIndex(1.0).ignoresSafeArea()
                VStack {
                    if showPopup {
                        popupResult(areaLength: areaLength, areaWidth: areaWidth, tileLength: tileLength, tileWidth: tileWidth, tilesPerBox: tilesPerBox, pricePerBox: pricePerBox, wastage: wastage, areaUnitIndex: areaUnitIndex, selectedShape: $selectedShape, selectedAbbrePrice: $selectedAbrePrice, selectedAbbrevArea: $selectedAbreLengthArea, selectedAbbrevTile: $selectedAbreLengthTile, showPopup: $showPopup, historyManager: historyManager)
                            .padding(.top, 90)
                    }
                }.zIndex(1.0)
                NavigationView {
                    VStack(spacing:0) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "c1ada0", transparency: 1.0))
                                .frame(width: .infinity, height: 150)
                            
                            textHeadingFitur(text: "Quick Count")
                                .padding(.top, 65)
                        }
                        ScrollView(.vertical) {
                            
                            VStack {
                                HStack {
                                    textSubHeadingGrouping(text: "area to cover")
                                    Spacer()
                                    Text("Already know the area of the room?")
                                        .font(.custom("Inter Bold", size: 11))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(hex:"946F5A", transparency: 1.0))
                                        .underline()
                                        .onTapGesture {
                                            showSheetArea = true
                                        }
                                }
                                .padding(.horizontal, 25)
                                .padding(.top, 12)
                                
                                VStack (spacing: 0) {
                                    ZStack {
                                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 10, style: .continuous)
                                            .fill(Color(hex: "ffffff", transparency: 0.7))
                                            .frame(width: .infinity, height: 44)
                                            .padding(.horizontal, 25)
                                            .padding(.top, 4)
                                        
                                        HStack {
                                            textBody17(text: "Shape")
                                            Spacer()
                                            pickerDropdown(icon: "chevron.up.chevron.down", items: ["Rectangle", "Circle","Triangle"], font: 12, width: 140, height: 23, bgColor: "946F5A", bgTransparency: 0.1, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedShape)
                                            
                                        }
                                        .padding(.horizontal, 45)
                                        .padding(.top, 8)
                                        
                                    }
                                    .padding(.top, 2)
                                    .frame(alignment: .center)
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.699999988079071)))
                                            .frame(width: .infinity, height: 44)
                                            .padding(.horizontal, 25)
                                        
                                        HStack {
                                            textBody17(text: "Length")
                                            Spacer()
                                            
                                            textfieldInput(text: $areaLength, placeholder: "3", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                .keyboardType(.numberPad)
                                            
                                            pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], font: 12, width: 57, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedAbreLengthArea)
                                                .onChange(of: selectedAbreLengthArea) { newValue in
                                                    selectedAbreWidthArea = newValue
                                                }
                                            
                                            
                                        }
                                        .padding(.horizontal, 45)
                                    }
                                    .frame(alignment: .center)
                                    
                                    ZStack {
                                        UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 0, style: .continuous)
                                            .fill(Color(hex: "ffffff", transparency: 0.7))
                                            .frame(width: .infinity, height: 44)
                                            .padding(.horizontal, 25)
                                        
                                        HStack {
                                            if selectedShape=="Triangle"{
                                                textBody17(text: "Height")
                                                
                                            }
                                            else {
                                                textBody17(text: "Width")
                                                
                                            }
                                            
                                            
                                            Spacer()
                                            
                                            textfieldInput(text:$areaWidth, placeholder: "3", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                .keyboardType(.numberPad)
                                            pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], font: 12, width: 57, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedAbreWidthArea)
                                                .onChange(of: selectedAbreWidthArea) { newValue in
                                                    selectedAbreLengthArea = newValue
                                                }
                                            
                                            
                                        }
                                        .padding(.horizontal, 45)
                                    }
                                    .frame(alignment: .center)
                                    
                                    HStack {
                                        textSubHeadingGrouping(text: "tile size")
                                        Spacer()
                                    }
                                    .padding(.horizontal, 25)
                                    .padding(.top, 20)
                                    
                                    VStack (spacing: 0) {
                                        ZStack {
                                            UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 10, style: .continuous)
                                                .fill(Color(hex: "ffffff", transparency: 0.7))
                                                .frame(width: .infinity, height: 44)
                                                .padding(.horizontal, 25)
                                                .padding(.top, 4)
                                            
                                            HStack {
                                                textBody17(text: "Length")
                                                Spacer()
                                                textfieldInput(text:$tileLength, placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                    .keyboardType(.numberPad)
                                                
                                                pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], font: 12, width: 57, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedAbreLengthTile)
                                                    .onChange(of: selectedAbreLengthTile) { newValue in
                                                        selectedAbreWidthTile = newValue
                                                    }
                                            }
                                            .padding(.horizontal, 45)
                                            .padding(.top, 12)
                                            
                                        }
                                        .padding(.top, 5)
                                        .frame(alignment: .center)
                                        
                                        ZStack {
                                            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 0, style: .continuous)
                                                .fill(Color(hex: "ffffff", transparency: 0.7))
                                                .frame(width: .infinity, height: 44)
                                                .padding(.horizontal, 25)
                                            
                                            HStack {
                                                textBody17(text: "Width")
                                                Spacer()
                                                
                                                textfieldInput(text:$tileWidth ,placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                    .keyboardType(.numberPad)
                                                
                                                pickerDropdown(icon: "chevron.up.chevron.down", items: ["meter", "centimeter","feet", "inch"], font: 12, width: 57, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedAbreWidthTile)
                                                    .onChange(of: selectedAbreWidthTile) { newValue in
                                                        selectedAbreLengthTile = newValue
                                                    }
                                            }
                                            .padding(.horizontal, 45)
                                        }
                                        .frame(alignment: .center)
                                        
                                        HStack {
                                            textSubHeadingGrouping(text: "what you want to buy")
                                            Spacer()
                                        }
                                        .padding(.horizontal, 25)
                                        .padding(.top, 20)
                                        
                                        VStack(spacing: 8) {
                                            ZStack {
                                                UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
                                                    .fill(Color(hex: "ffffff", transparency: 0.7))
                                                    .frame(width: .infinity, height: 44)
                                                    .padding(.horizontal, 25)
                                                
                                                HStack {
                                                    textBody17(text: "Tiles per box")
                                                    Spacer()
                                                    
                                                    textfieldInput(text:$tilesPerBox, placeholder: "6", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
                                                        .keyboardType(.numberPad)
                                                }
                                                .padding(.horizontal, 45)
                                            }
                                            
                                            ZStack {
                                                UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
                                                    .fill(Color(hex: "ffffff", transparency: 0.7))
                                                    .frame(width: .infinity, height: 44)
                                                    .padding(.horizontal, 25)
                                                
                                                HStack {
                                                    textBody17(text: "Price")
                                                    Spacer()
                                                    
                                                    pickerDropdown(icon: "chevron.up.chevron.down", items: ["IDR", "EUR","SGD", "USD"], font: 12, width: 65, height: 23, bgColor: "c1ada0", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20, transfer: $selectedAbrePrice)
                                                    
                                                    textfieldInput(text:$pricePerBox , placeholder: "60000", font: 17, width: 130, height: 32, cornerRadius: 8, satuan: "/ box")
                                                        .keyboardType(.numberPad)
                                                    
                                                }
                                                .padding(.horizontal, 45)
                                            }
                                            
                                            ZStack {
                                                UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
                                                    .fill(Color(hex: "ffffff", transparency: 0.7))
                                                    .frame(width: .infinity, height: 44)
                                                    .padding(.horizontal, 25)
                                                
                                                HStack {
                                                    textBody17(text: "Wastage")
                                                    Spacer()
                                                    
                                                    textfieldInput(text:$wastage, placeholder: "5", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "%")
                                                        .keyboardType(.numberPad)
                                                    
                                                }
                                                .padding(.horizontal, 45)
                                            }
                                        }
                                        .padding(.top, 5)
                                        .frame(alignment: .center)
                                        
                                        VStack(spacing: 8) {
                                            button(icon: "", text: "Calculate", width: 335, height: 49, font: 15, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20) {
                                                showPopup.toggle()
                                                
                                            }
                                            button(icon: "", text: "Clear All", width: 335, height: 49, font: 15, bgColor: "ded4cd", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20) {
                                                alert = true
                                            }
                                            
                                        }
                                        .padding(.top, 32)
                                        
                                    }
                                    Spacer()
                                }
                    
                                Spacer()
                                    .frame(minHeight: 0, maxHeight: .infinity)
                            }
                        }.modifier(KeyboardAwareModifier())

                        
                    }
                    .background(Color(hex: "F2EEEB", transparency: 1.0))
                    .ignoresSafeArea()
                    .zIndex(0)
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        showPopup = false
                    }
                    .sheet(isPresented: $showSheetArea) {
                        sheetCalculateArea(showPopup: $showSheetArea).ignoresSafeArea()
                    }
                    
                }

            }
        }.ignoresSafeArea()
    }
}

struct KeyboardAwareModifier: ViewModifier {
    @State private var currentHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, currentHeight)
            .onAppear(perform: {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                        return
                    }
                    withAnimation {
                        self.currentHeight = keyboardFrame.height
                    }
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    withAnimation {
                        self.currentHeight = 0
                    }
                }
            })
    }
}




#Preview {
    QuickCount()
        .environmentObject(HistoryManager())
}
