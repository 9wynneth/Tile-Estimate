////
////  dropdownbtnList.swift
////  Tile Estimate
////
////  Created by Gwynneth Isviandhy on 29/04/24.
////
//
//import SwiftUI
//
//struct dropdownbtnList: View {
//    let options: [String]
//    let selection: Binding<String?>
//    let label: String
//    
//    var body: some View {
//        Menu {
//            ForEach(options, id: \.self) { option in
//                Button(action: {
//                    selection.wrappedValue = option
//                }) {
//                    Text(String(describing: option))
//                }
//            }
//        } label: {
//            Text(label)
//        }
//    }
//}
//
//#Preview {
//    dropdownbtnList(options: dropdownOptions, selection: selectedOption, label: "Dropdown")
//}
