//
//  Album.swift
//  SwiftUIAssignment
//
//  Created by Hello World on 21/03/22.
//

import Foundation

typealias Albums = [Album]

struct Album: Codable, Identifiable {
    let albumID, id: Int?
    let title: String?
    let url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
