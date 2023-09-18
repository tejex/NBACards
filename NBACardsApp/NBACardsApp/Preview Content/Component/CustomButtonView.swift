//
//  CustomButtonView.swift
//  NBACardsApp
//
//  Created by Bamlak Deju on 9/8/23.
//

import SwiftUI

//Here we are creating a new view just for the button and adding some styling
//for it as well. This is the case for some of the important parts of the App
//such as the background of the app and so on

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle().fill(
                    LinearGradient(colors:
                        [
                        .customGreenLight,
                        .customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
            )
            Circle()
                .stroke(LinearGradient(
                    colors:[
                        .customGrayLight,
                        .customGreenMedium],
                    startPoint: .top,
                    endPoint: UnitPoint.bottom)
                        ,lineWidth: 4)
            Image(systemName: "arrow.right")
                .fontWeight(.black)
                .font(.system(size:30))
                .foregroundStyle(LinearGradient(
                    colors:[
                        .customGrayLight,
                        .customGrayMedium],
                    startPoint: .top,
                    endPoint: UnitPoint.bottom))
        }
        .frame(width: 58, height: 58)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
