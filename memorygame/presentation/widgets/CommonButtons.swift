//
//  CommonButtons.swift
//  memorygame
//
//  Created by Jontahan Ixcayau on 27/04/23.
//

import SwiftUI

struct CommonButtons: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient:
                                Gradient(
                                    colors: [
                                        Color("GradientPink"), Color("GradientPurple")
                                    ]
                                ),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .cornerRadius(25)
                    )
            }
        )
        .buttonStyle(PlainButtonStyle())
    }
}

struct SecondaryButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [Color(hex: 0xFF5F6D), Color(hex: 0xFF3CAC)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal, 24)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}


struct CommonButtons_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtons(
            title: "Login",
            action: {
                
            }
        )
    }
}
