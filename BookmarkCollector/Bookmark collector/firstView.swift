//
//  firstView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 04.04.2023.
//

import SwiftUI

struct firstView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                Color.black.opacity(0.2)
                Image("image81")
                    .resizable()
                    .frame(width: 390, height: 614)
            }
            .edgesIgnoringSafeArea(.all)
            
            Text("Save all interesting links in one app")
//                .frame(width: 358)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 36))
                .lineSpacing(12)
                .padding(.trailing, 40)
            
            Button(action: {}, label: {
                Text("Let's start collecting")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
            })
            .frame(width: 358, height: 58)
            .background(Color.white)
            .cornerRadius(16)
            .padding(.bottom, 50)
        }
        .background(Color.black)
    }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}
