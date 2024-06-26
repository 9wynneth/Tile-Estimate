//
//  CustomAlertView.swift
//  Tile Estimate
//
//  Created by Gwynneth Isviandhy on 29/04/24.
//

import SwiftUI

struct CustomAlert <Content: View>: View {
    let title: String
    let description: String

    @State private var textFieldValue = ""

    var cancelAction: (() -> Void)?
    var cancelActionTitle: String?

    var primaryAction: (() -> Void)?
    var primaryActionTitle: String?

    var customContent: Content?

    init(title: String,
         description: String,
         cancelAction: (() -> Void)? = nil,
         cancelActionTitle: String? = nil,
         primaryAction: (() -> Void)? = nil,
         primaryActionTitle: String? = nil,
         customContent: Content? = EmptyView()) {
        self.title = title
        self.description = description
        self.cancelAction = cancelAction
        self.cancelActionTitle = cancelActionTitle
        self.primaryAction = primaryAction
        self.primaryActionTitle = primaryActionTitle
        self.customContent = customContent
    }

    var body: some View {
        HStack {
            VStack(spacing: 0) {
                textHeading(text: title)
                    .padding(.top)
                    .padding(.bottom, 8)
                    .fontWeight(.black)

                textBody12(text: description)
                    .font(.system(size: 12, weight: .light, design: .default))
                    .multilineTextAlignment(.center)
                    .padding([.bottom, .trailing, .leading])

//                customContent

//                Divider()

                HStack {
                    if let cancelAction, let cancelActionTitle {
                        Button { cancelAction() } label: {
                            Text(cancelActionTitle)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.red)
                        }
                    }

                    if cancelActionTitle != nil && primaryActionTitle != nil {
                        Divider()
                    }

                    if let primaryAction, let primaryActionTitle {
                        Button { primaryAction() } label: {
                            Text("**\(primaryActionTitle)**")
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.blue)

                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
            }
            .frame(minWidth: 0, maxWidth: 400, alignment: .center)
            .background(Color(hex: "e0c9bb", transparency: 1.0))
            .cornerRadius(10)
            .padding([.trailing, .leading], 50)
        }
        .zIndex(1)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(
            Color(red: 0, green: 0, blue: 0, opacity: 0.4)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(
            title: "Are you sure?",
            description: "By clicking 'Clear', all data you have entered will be permanently deleted.",
            cancelAction: {
                // Cancel action here
                
            },
            cancelActionTitle: "Cancel",
            primaryAction: {
                // Primary action here
                
            },
            primaryActionTitle: "Clear",
            customContent: Text("")
                .padding([.trailing, .leading, .bottom])
        ).cornerRadius(14)
    }
}
