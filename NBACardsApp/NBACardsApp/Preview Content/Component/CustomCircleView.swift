//
//  CustomCircleView.swift
//  NBACardsApp
//
//  Created by Bamlak Deju on 9/10/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradiet: Bool = false;
    var body: some View {
        ZStack {
            Circle()
                .opacity(0.12)
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimateGradiet.toggle()
                    }
                }
            MotionAnimationView()
        }
        .frame(width: 300)
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
