//
//  ActionSheetView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 06.04.2023.
//

import SwiftUI

struct ActionSheetView: View {
    var body: some View {
        VStack {
            Text("Bookmark App")
                .font(.system(size: 17))
                .fontWeight(.bold)
            
            Spacer()
            
            Text("Save your first\nbookmark")
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(height: 362)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .frame(width: 12, height: 12)
                        }
                        .padding(.top, 22)
                    }
                    
                    Text("Title")
                        .padding(.top, 22)
                    
                    TextField("Bookmark title", text: .constant(""))
                        .padding(.horizontal, 17)
                        .padding(.vertical, 12)
                        .frame(width: 358, height: 46)
                        .background(Color(red: 242/255, green: 242/255, blue: 238/255))
                        .cornerRadius(12)
                    
                    Text("Link")
                        .padding(.top, 16)
                    
                    TextField("Bookmark link (URL)", text: .constant(""))
                        .padding(.horizontal, 17)
                        .padding(.vertical, 12)
                        .frame(width: 358, height: 46)
                        .background(Color(red: 242/255, green: 242/255, blue: 238/255))
                        .cornerRadius(12)
                    
                    Button(action: {}) {
                        Text("Save")
                    }
                    .foregroundColor(.white)
                    .frame(width: 358, height: 58)
                    .background(Color.black)
                    .cornerRadius(16)
                    .padding(.bottom, 50)
                    .padding(.top, 24)
                }
                .padding(16)
            }
        }
        .background(Color.black.opacity(0.3))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}
