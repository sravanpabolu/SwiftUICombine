//
//  AlbumListView.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import SwiftUI

struct AlbumListView: View {
    @StateObject var albumViewModel = AlbumViewModel()
    
    var body: some View {
        if let albums = albumViewModel.albums {
            List(albums) { anAlbum in
                AlbumRowView(album: anAlbum)
            }
            .task {
                await albumViewModel.getAlbums()
            }
//            .animation(.easeOut, value: 200)
        } else {
            VStack {
                Text("Please wait... fetching Albums...")
                ProgressView()
            }
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}


