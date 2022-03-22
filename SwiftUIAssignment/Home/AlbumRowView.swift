//
//  AlbumView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import SwiftUI

struct AlbumRowView: View {
    let album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    @State private var isExpanded: Bool = false
    private var title: String {
        album.title ?? "No Title"
    }
    private var albumID: Int {
        album.albumID ?? 000
    }
    private var id: Int {
        album.id ?? 000
    }
    private var imageUrl: URL {
        URL(string: album.url ?? "") ?? URL(string: "")!
    }
    
    var body: some View {
        if let thumbImageUrl = URL(string: album.thumbnailURL ?? "") {
            if isExpanded {
                expandedRowView(thumbImageUrl)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            } else {
                contractedRowView(thumbImageUrl)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            }
        } else {
            noImageView
        }
//        expandedRowView(URL(string: ""))
    }
    
    var noImageView: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 10) {
            Image(Constants.noImageIcon, bundle: .main)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
            Text(title)
            Spacer()
        }
    }
    
    private func expandedRowView(_ thumbImageUrl: URL?) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                AsyncImage(
                    url: thumbImageUrl,
                    content: { anImage in
                        anImage
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                )
                Spacer()
            }
            Text(title)
            Text("ID: \(id)")
            Text("Album ID:\(albumID)")
        }
        .padding()
    }
    
    
    private func contractedRowView(_ thumbImageUrl: URL) -> some View {
        HStack(alignment: VerticalAlignment.center, spacing: 10) {
            AsyncImage(
                url: thumbImageUrl,
                content: { anImage in
                    anImage
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                },
                placeholder: {
                    ProgressView()
                        .foregroundColor(.red)
                }
            )
            
            Text(title)
            Spacer()
        }
        .padding()
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album(albumID: 1, id: 1, title: "Delhi-6", url: "", thumbnailURL: "")
        AlbumRowView(album: album)
    }
}
