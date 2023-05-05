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

struct CommonButtons_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtons(
            title: "Login",
            action: {
                
            }
        )
    }
}
