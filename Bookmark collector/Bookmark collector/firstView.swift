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
            backgroundImage
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                Text("Save all interesting links in one app")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 36))
                    .lineSpacing(12)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 358, height: 92, alignment: .leading)
                
                Button(action: {
                    UserDefaults.standard.set(false, forKey: "welcome")
                }, label: {
                    Text("Let's start collecting")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 310)
                        .font(.system(size: 16))
                })
                .frame(width: 358, height: 58)
                .background(Color.white)
                .cornerRadius(16)
            }
        }
        .padding(.bottom, 50)
        .background(Color.black)
    }
    
    var backgroundImage: some View {
        ZStack {
            Image("backgroundImage")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 614)
        }
    }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}
