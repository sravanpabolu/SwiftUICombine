//
//  AlbumView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import SwiftUI

struct AlbumRowView: View {
    let album: Album
    
    var body: some View {
        let title = album.title ?? "No Title"
        if let thumbImageUrl = URL(string: album.thumbnailURL ?? "") {
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
        } else {
            HStack(alignment: VerticalAlignment.center, spacing: 10) {
                Image(Constants.noImageIcon, bundle: .main)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                Text(title)
                Spacer()
            }
        }
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        let album = Album(albumID: 1, id: 1, title: "Delhi-6", url: "", thumbnailURL: "")
        AlbumRowView(album: album)
    }
}
