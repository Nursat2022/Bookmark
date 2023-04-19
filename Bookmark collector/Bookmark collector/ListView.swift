//
//  ListView.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 05.04.2023.
//

import SwiftUI

struct ListView: View {
    @Binding var bookmarks: [bookMark]
    @AppStorage("bookmarks") var bookmarksData: Data = Data()
    var image = Image("Group")
    var body: some View {
        VStack {
            Text("List")
                .fontWeight(.bold)
            List(bookmarks) { bookmark in
                bookmark
                    .listRowInsets(EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16))
                    .padding(.top, 28)
                    .listRowBackground(Color.black.opacity(0))
                    .swipeActions {
                        Button(role: .destructive, action: {
                            if let index = bookmarks.firstIndex(where: { $0.id == bookmark.id }) {
                                bookmarks.remove(at: index)
                                do {
                                    let encodedBookmarks = try JSONEncoder().encode(bookmarks)
                                    bookmarksData = encodedBookmarks
                                } catch {
                                    print("Error encoding bookmarks: \(error)")
                                }
                            }
                        }) {
                            Text("Delete")
                        }
                        .tint(.red)
                        
                        Button(action: {}) {
                            Text("Change")
                        }
                        .tint(.blue)
                        
                    }
            }
            .listStyle(.plain)
        }
    }
}

