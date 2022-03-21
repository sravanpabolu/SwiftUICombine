//
//  AlbumViewModel.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import Foundation
import Combine

class AlbumViewModel: ObservableObject {
    @Published var albums: Albums = [Album(albumID: 0, id: 0, title: "Album ZERO", url: "", thumbnailURL: "")]
    
    private var cancellable = Set<AnyCancellable>()
    
    func getAlbums() async {
        do {
            try NetworkManager.shared.getDataFromNetwork(for: Constants.albumApiUrl, type: Albums.self)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        print("Oops.. some error : \(error.localizedDescription)")
                    case .finished:
                        print("Finished")
                    }
                } receiveValue: { [weak self] albums in
                    self?.albums = albums
                }
                .store(in: &cancellable)
        } catch {
            print("Some error: \(error.localizedDescription)")
        }
    }
}
