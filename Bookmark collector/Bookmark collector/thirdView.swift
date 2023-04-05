//
//  thirdView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 05.04.2023.
//

import SwiftUI

struct thirdView: View {
    var image = Image("Group")
    var body: some View {
        VStack {
            Text("List")
                .padding(.top, 10)
                .padding(.bottom, 20)
            VStack {
                HStack {
                    Text("Google")
                    Spacer()
                    image
                }
                
                Divider()
                
                HStack {
                    Text("nFactorial School")
                    Spacer()
                    image
                    Group {
                        Button(action: {}) {
                            Text("Change")
                        }
                        .foregroundColor(.white)
                        .frame(width: 74, height: 64)
                        .background(Color.blue)
                        .padding(.trailing, -8)
                        
                        Button(action: {}) {
                            Text("Delete")
                        }
                        .foregroundColor(.white)
                        .frame(width: 74, height: 64)
                        .background(Color.red)
                        .padding(.trailing, -17)
                    }
                    .padding(.bottom, -12)
                }
                
                Divider()
                
                HStack {
                    Text("NY Times")
                    Spacer()
                    image
                }
                .padding(.vertical, 20)
                
                Divider()
                
                HStack {
                    Text("Bloomberg")
                    Spacer()
                    image
                }
                .padding(.vertical, 20)
                
                Divider()
                
            }
            .padding(.horizontal, 16)
//            .padding(.vertical, 11)
            
            Spacer()
            
            Button(action: {}) {
                Text("Add bookmark")
                    .foregroundColor(.white)
            }
            .frame(width: 358, height: 58)
            .background(Color.black)
            .cornerRadius(16)
        }
    }
}

struct thirdView_Previews: PreviewProvider {
    static var previews: some View {
        thirdView()
    }
}
