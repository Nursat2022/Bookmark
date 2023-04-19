//
//  firstView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 04.04.2023.
//

import SwiftUI

struct firstView: View {
//    @AppStorage("welcomeScreen") var showWelcomeScreen: Bool = false
    
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
            
            VStack(spacing: 24) {
                Text("Save all interesting links in one app")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 36))
                    .lineSpacing(12)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing, 40)
                    .frame(width: 358, height: 92)
                
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
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}
