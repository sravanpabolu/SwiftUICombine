//
//  AlbumViewModel.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import Foundation

class AlbumViewModel: ObservableObject {
    @Published var albums: Albums = [Album(albumID: 0, id: 0, title: "Album ZERO", url: "", thumbnailURL: "")]
    
    func getAlbums() -> Albums {
        [Album(albumID: 1, id: 1, title: "Album One", url: "", thumbnailURL: ""),
         Album(albumID: 2, id: 2, title: "Album Two", url: "", thumbnailURL: "")
        ]
    }
}
