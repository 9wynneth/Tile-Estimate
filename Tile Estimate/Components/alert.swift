////
////  alert.swift
////  Tile Estimate
////
////  Created by Gwynneth Isviandhy on 27/04/24.
////
//
//import SwiftUI
//
//struct customAlertCoba: View {
//    var title: String?
//    var message: String?
//    var primaryButtonLabel: String
//    var primaryButtonAction: () -> Void
//    var secondaryButtonLabel: String?
//    var secondaryButtonAction: (() -> Void)?
//    var image: Image?
//    
//    var body: some View {
//        VStack {
//            if let image = image {
//                image
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 80, height: 80)
//            } else if let title = title{
//                Text(title)
//                    .font(.headline)
//                    .multilineTextAlignment(.center)
//            }
//            if let message = message {
//                Text(message)
//                    .font(.subheadline)
//                    .multilineTextAlignment(.center)
//                    .padding()
//            }
//            
//            HStack(spacing: 16) {
//                if let secondaryButtonLabel = secondaryButtonLabel {
//                    Button(action: {
//                        self.secondaryButtonAction?()
//                    }, label: {
//                        Text(secondaryButtonLabel)
//                            .font(.headline)
//                            .foregroundColor(.red)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color(hex:"e0c9bb", transparency: 1.0))
//                            .cornerRadius(12)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(Color(hex:"ffffff", transparency: 1.0), lineWidth: 1)
//                            )
//                    })
//                }
//                Button(action: {
//                    self.primaryButtonAction()
//                }, label: {
//                    Text(primaryButtonLabel)
//                        .font(.headline)
//                        .foregroundColor(.blue)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color(hex:"ffffff", transparency: 1.0))
//                        .cornerRadius(12)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(Color(hex:"ffffff", transparency: 1.0), lineWidth: 1)
//                        )
//                })
//            }
//        }
//        .padding()
//        .background(Color(hex:"e0c9bb", transparency: 1.0))
//        .cornerRadius(20)
//        .shadow(radius: 20)
//    }
//}
//
//
//
//struct CustomAlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
////            CustomAlertView(title: "Success!", message: "Your profile was updated successfully.", primaryButtonLabel: "OK", primaryButtonAction: {})
////                .previewLayout(.sizeThatFits)
////                .padding()
//            
//            customAlertCoba(title: "Error!", message: "There was an error updating your profile.", primaryButtonLabel: "Try Again", primaryButtonAction: {}, secondaryButtonLabel: "Cancel", secondaryButtonAction: {})
//                .previewLayout(.sizeThatFits)
//                .padding()
//            
//            customAlertCoba(title: "Confirmation", message: "Are you sure you want to delete this item?", primaryButtonLabel: "Yes", primaryButtonAction: {}, secondaryButtonLabel: "No", secondaryButtonAction: {})
//                .previewLayout(.sizeThatFits)
//                .padding()
//            
//            customAlertCoba(title: "Warning!", message: "You are about to perform a critical operation.", primaryButtonLabel: "Proceed", primaryButtonAction: {}, secondaryButtonLabel: "Cancel", secondaryButtonAction: {})
//                .previewLayout(.sizeThatFits)
//                .padding()
//            
//            customAlertCoba(
//                message: "An error occurred.",
//                primaryButtonLabel: "OK",
//                primaryButtonAction: {},
//                secondaryButtonLabel: nil,
//                secondaryButtonAction: nil,
//                image: Image(systemName: "exclamationmark.triangle")
//            )
//            .previewLayout(.sizeThatFits)
//            .padding()
//            
//        }
//    }
//}
