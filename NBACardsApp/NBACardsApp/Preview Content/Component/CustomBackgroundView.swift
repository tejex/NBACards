//
//  CustomBackgroundView.swift
//  NBACardsApp
//
//  Created by Bamlak Deju on 9/5/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            Color.customGrayLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            LinearGradient(colors: [
                Color.customGrayMedium,
                Color.customGreenLight], startPoint: .topLeading, endPoint: .bottomTrailing)
            .cornerRadius(40)
        }
    }
}

struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding(10)
    }
}
