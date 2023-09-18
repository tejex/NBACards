//
//  GradientButtonStyle.swift
//  NBACardsApp
//
//  Created by Bamlak Deju on 9/8/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        // gotta chamge the style of the button when its clicked.
        // use swift ternary operator to accomplish this.
        //This will be done in the background section of this button style
        configuration
            .label
            .frame(width: 120,height: 40)
            .background(
                //gotta style it here when its clicked vs when not clicked
                configuration.isPressed ? LinearGradient(
                    colors:[
                        .customGrayMedium,
                        .customGrayLight],
                        startPoint: .top,
                    endPoint: .bottom)
                    :
                    LinearGradient(
                        colors:[
                            .customGrayLight,
                            .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
            )
        
            .cornerRadius(40)
            .padding(.vertical)
            .padding(.horizontal, 10)
    }
}
