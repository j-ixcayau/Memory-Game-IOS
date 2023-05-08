//
//  PasswordInput.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 7/05/23.
//

import SwiftUI

struct PasswordInput: View {
    @Binding var content: String
    
    var title: String?
    var hint: String?
    
    var keyboardType: UIKeyboardType = UIKeyboardType.default
    
    @State private var showPassword: Bool = false
    
    private var inputView: AnyView {
        if showPassword {
            return AnyView(
                TextField(hint ?? "", text: $content)
            )
        } else {
            return AnyView(
                SecureField(hint ?? "", text: $content)
            )
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            if let title = title, !title.isEmpty {
                Text(title)
                    .foregroundColor(Color.primary)
            }
            
            ZStack (alignment: Alignment.trailing){
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
                
                Button(
                    action: {
                        showPassword.toggle()
                    },
                    label: {
                        Image(
                            systemName: showPassword ? "eye.fill" : "eye.slash.fill"
                        )
                        .foregroundColor(Color("GradientPink"))
                    }
                )
                .padding()
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 2)
    }
}


struct PasswordInput_Previews: PreviewProvider {
    static var previews: some View {
        PasswordInput(
            content: .constant(""),
            title: "Password",
            hint: "Enter your password"
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color("BackgroundColor"))
    }
}
