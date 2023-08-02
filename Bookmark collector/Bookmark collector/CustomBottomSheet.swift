//
//  CustomActionSheet.swift
//  Bookmark collector
//
//  Created by Nursat Sakyshev on 02.08.2023.
//

import SwiftUI

struct CustomBottomSheet: View {
    @Binding var bookmarks: [bookMark]
    @Binding var showActionSheet: Bool
    @Binding var bookmarkTitle: String
    @Binding var bookmarkLink: String
    @AppStorage("bookmarks") var bookmarksData: Data = Data()
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: UIScreen.main.bounds.width, height: 362)
            
            VStack(alignment: .leading, spacing: 0) {
                header
                    .padding(.vertical, 22)
                
                VStack(spacing: 16) {
                    customTextField(linkOrTitle: $bookmarkTitle, placeHolder: "Bookmark title")
                        .withTitle(title: "Title")
                    
                    customTextField(linkOrTitle: $bookmarkLink, placeHolder: "Bookmark link (URL)")
                        .withTitle(title: "Link")
                }
                .padding(.bottom, 24)
                
                blackButton(text: "Save") {
                    action()
                    do {
                        let encodedBookmarks = try JSONEncoder().encode(bookmarks)
                        bookmarksData = encodedBookmarks
                    } catch {
                        print("Error encoding bookmarks: \(error)")
                    }
                    showActionSheet = false
                    bookmarkTitle = ""
                    bookmarkLink = ""
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
    
    var header: some View {
        HStack {
            Spacer()
            Button(action: {
                showActionSheet = false
                hideKeyboard()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
        }
    }
}
