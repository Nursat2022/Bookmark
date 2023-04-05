//
//  SecondView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 04.04.2023.
//

import SwiftUI

struct SecondView: View {
    @State private var showActionSheet = false
    @State private var bookmarkTitle = ""
    @State private var bookmarkLink = ""
    
    var body: some View {
        VStack {
            Text("Bookmark App")
                .font(.system(size: 17))
                .fontWeight(.bold)
            
            Spacer()
            
            Text("Save your first \nbookmark")
                .font(.system(size: 34))
                .fontWeight(.bold)
                .lineSpacing(10)
                .frame(width: 358, height: 92)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button(action: {showActionSheet = true}) {
                Text("Add bookmark")
                    .foregroundColor(.white)
            }
            
            .frame(width: 358, height: 58)
            .background(Color.black)
            .cornerRadius(16)
            .padding(.bottom, 50)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
