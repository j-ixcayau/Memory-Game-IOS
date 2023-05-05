//
//  CommonInput.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 23/04/23.
//

import SwiftUI

struct CommonInput: View {
    @Binding var content: String
    
    var title: String?
    var hint: String?
    var isPassword: Bool = false
    
    var keyboardType: UIKeyboardType = UIKeyboardType.default
    
    
    private var inputView: AnyView {
        if isPassword {
            return AnyView(
                SecureField(hint ?? "", text: $content)
            )
        } else {
            return AnyView(
                TextField(hint ?? "", text: $content)
            )
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if let title = title, !title.isEmpty {
                Text(title)
                    .foregroundColor(Color.primary)
            }
            
            inputView
                .keyboardType(keyboardType)
                .padding(.all, 10)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color("GradientPink"),
                                        Color("GradientPurple")
                                    ]
                                ),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
                .frame(maxWidth: .infinity)
                .frame(height: 45)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 2)
    }
}


struct CommonInput_Previews: PreviewProvider {
    static var previews: some View {
        CommonInput(
            content: .constant(""),
            title: "Username",
            hint: "Enter your username"
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color("BackgroundColor"))
    }
}
