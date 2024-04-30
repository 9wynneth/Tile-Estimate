////
////  sheetCalculateArea.swift
////  Tile Estimate
////
////  Created by Gwynneth Isviandhy on 28/04/24.
////
//
//import SwiftUI
//
//struct sheetCalculateArea: View {
//    var body: some View {
//        VStack {
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color(#colorLiteral(red: 0.9490196108818054, green: 0.9333333373069763, blue: 0.9215686321258545, alpha: 1)))
//                    .frame(width: .infinity, height: 700)
//                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05000000074505806)), radius:100, x:0, y:0)
//                VStack {
//                    HStack {
//                        textHeading(text: "Calculation With Area").padding(.trailing, 10)
//                        Spacer()
//                        button(icon: "", text:"X", width: 30, height:30, font: 15, bgColor: "ded4cd", bgTransparency: 1.0 , fontColor:"7F7F7F", fontTransparency: 0.5, cornerRadius: 20)
//                    }.padding(.horizontal,12).padding(.top,8)
//                    
//                    VStack {
//                        HStack {
//                            textBody12(text: "area to cover")
//                            Spacer()
//                        }.padding(.horizontal,25).padding(.top,16)
//                        
//                        VStack (spacing:0){
//                            ZStack {
//                                UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
//                                    .fill(Color(hex: "ffffff", transparency: 0.7))
//                                    .frame(width: .infinity, height: 44)
//                                    .padding(.horizontal,25).padding(.top,4)
//                                
//                                HStack {
//                                    textBody17(text: "Shape")
//                                    Spacer()
//                                    button(icon: "chevron.up.chevron.down", text: "Rectangle", width: 140, height: 23, font: 12, bgColor: "946F5A", bgTransparency: 0.1, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
//                                }
//                                .padding(.horizontal,45).padding(.top,12)
//                                
//                            }.padding(.top,5)
//                                .frame(alignment: .center)
//
//                            
//                            HStack {
//                                textBody12(text: "tile size")
//                                Spacer()
//                            }.padding(.horizontal,25).padding(.top,20)
//                            
//                            VStack (spacing:0){
//                                ZStack {
//                                    
//                                    UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 10, style: .continuous)
//                                        .fill(Color(hex: "ffffff", transparency: 0.7))
//                                        .frame(width: .infinity, height: 44)
//                                        .padding(.horizontal,25).padding(.top,4)
//                                    
//                                    HStack {
//                                        textBody17(text: "Length")
//                                        Spacer()
//                                        textfieldInput(placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
//                                            .keyboardType(.numberPad)
//                                        
//                                        button(icon: "chevron.up.chevron.down", text: "m", width: 57, height: 23, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
//                                    }
//                                    .padding(.horizontal,45).padding(.top,12)
//                                    
//                                }.padding(.top,5)
//                                    .frame(alignment: .center)
//                                
//                                ZStack {
//                                    UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 0, style: .continuous)
//                                        .fill(Color(hex: "ffffff", transparency: 0.7))
//                                        .frame(width: .infinity, height: 44)
//                                        .padding(.horizontal,25)
//                                    HStack {
//                                        textBody17(text: "Width")
//                                        Spacer()
//                                        
//                                        textfieldInput(placeholder: "40", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
//                                            .keyboardType(.numberPad)
//                                        
//                                        button(icon: "chevron.up.chevron.down", text: "m", width: 57, height: 23, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
//                                    }
//                                    .padding(.horizontal,45)
//                                }
//                                .frame(alignment: .center)
//                                
//                                HStack {
//                                    textBody12(text: "what you want to buy")
//                                    Spacer()
//                                }.padding(.horizontal,25).padding(.top,20)
//                                
//                                VStack(spacing:8) {
//                                    ZStack {
//                                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
//                                            .fill(Color(hex: "ffffff", transparency: 0.7))
//                                            .frame(width: .infinity, height: 44)
//                                            .padding(.horizontal,25)
//                                        HStack {
//                                            textBody17(text: "Tiles per box")
//                                            Spacer()
//                                            
//                                            textfieldInput(placeholder: "6", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "")
//                                                .keyboardType(.numberPad)
//                                        }
//                                        .padding(.horizontal,45)
//                                    }
//                                    
//                                    ZStack {
//                                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
//                                            .fill(Color(hex: "ffffff", transparency: 0.7))
//                                            .frame(width: .infinity, height: 44)
//                                            .padding(.horizontal,25)
//                                        HStack {
//                                            textBody17(text: "Price")
//                                            Spacer()
//                                            
//                                            button(icon: "chevron.up.chevron.down", text: "IDR", width: 60, height: 23, font: 12, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
//                                            
//                                            textfieldInput(placeholder: "60000", font: 17, width: 127, height: 32, cornerRadius: 8, satuan: "")
//                                                .keyboardType(.numberPad)
//                                            
//                                        }
//                                        .padding(.horizontal,45)
//                                    }
//                                    
//                                    ZStack {
//                                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .continuous)
//                                            .fill(Color(hex: "ffffff", transparency: 0.7))
//                                            .frame(width: .infinity, height: 44)
//                                            .padding(.horizontal,25)
//                                        HStack {
//                                            textBody17(text: "Wastage")
//                                            Spacer()
//                                            
//                                            textfieldInput(placeholder: "5", font: 17, width: 70, height: 32, cornerRadius: 8, satuan: "%")
//                                                .keyboardType(.numberPad)
//                                            
//                                        }
//                                        .padding(.horizontal,45)
//                                    }
//                                    
//                                    
//                                }.padding(.top,5)
//                                    .frame(alignment: .center)
//                                
//                                VStack(spacing:8) {
//                                    button(icon: "", text: "Calculate", width: 335, height: 49, font: 15, bgColor: "946F5A", bgTransparency: 0.5, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
//                                    
//                                    button(icon: "", text: "Clear All", width: 335, height: 49, font: 15, bgColor: "ded4cd", bgTransparency: 1.0, fontColor: "3C3C43", fontTransparency: 0.6, cornerRadius: 20)
//                                    
//                                }.padding(.top,40)
//                                
//                            }
//                            Spacer()
//                        }
//                        
//                        Spacer()
//                        
//                    }
//                    
//                    Spacer()
//                }
//                
//              
//            }
//        }.ignoresSafeArea()
//        .frame(width: .infinity, height: 600)
//
//    }
//}
//
//#Preview {
//    sheetCalculateArea()
//}
