//
//  fourthView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 05.04.2023.
//

import SwiftUI

struct fourthView: View {
    @State private var showActionSheet = false
    @State private var bookmarkTitle = ""
    @State private var bookmarkLink = ""
    @State private var cancel = false
    
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
                .position(x: 195, y: 335)
            
            Spacer()
            
            if !showActionSheet {
                Button(action: {showActionSheet = true}) {
                    Text("Add bookmark")
                        .foregroundColor(.white)
                }
                .frame(width: 358, height: 58)
                .background(Color.black)
                .cornerRadius(16)
                .padding(.bottom, 50)
            }
    
            
            if showActionSheet {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(height: 362)
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Button(action: { showActionSheet = false }) {
                                Image("Vector")
                                    .padding(.vertical, 22)
                            }
                
                        }
                        Text("Title")
                        TextField("Bookmark title", text: $bookmarkTitle)
                            .padding(17)
                            .frame(width: 358, height: 46)
                            .background(Color(red: 242/255, green: 242/255, blue: 238/255))
                            .cornerRadius(16)
                        
                        Text("Link")
                        TextField("Bookmark link(URL)", text: $bookmarkLink)
                            .padding(17)
                            .frame(width: 358, height: 46)
                            .background(Color(red: 242/255, green: 242/255, blue: 238/255))
                            .cornerRadius(16)
                        
        
                        Button(action: {showActionSheet = true}) {
                            Text("Save")
                                .foregroundColor(.white)
                        }
                        
                        .frame(width: 358, height: 58)
                        .background(Color.black)
                        .cornerRadius(16)
                        .padding(.bottom, 50)
                        .padding(.top, 24)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, -10)
                }
//                .offset(y: showActionSheet ? 0 : UIScreen.main.bounds.height)
            }
        }
        .animation(.spring())
        .background(showActionSheet ? Color.black.opacity(0.3) : .white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct fourthView_Previews: PreviewProvider {
    static var previews: some View {
        fourthView()
    }
}
