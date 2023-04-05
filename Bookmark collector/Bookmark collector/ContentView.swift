//
//  ContentView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 04.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            HStack {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            .swipeActions{
                Button("Action 1") {
                    // handle action 1
                }
                Button("Action 2") {
                    // handle action 2
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
