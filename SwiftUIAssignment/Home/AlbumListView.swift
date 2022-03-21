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
        List(albumViewModel.albums) { anAlbum in
            AlbumRowView(album: anAlbum)
        }
        .task {
            await albumViewModel.getAlbums()
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}


