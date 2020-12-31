//
//  Entities.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 11/21/20.
//

import Foundation

struct Response: Codable {
    var code: Int?
    var status, attributionText: String?
    var data: MarvelData?
}

struct MarvelData: Codable {
    let count, limit, offset: Int?
    let results: [Characters]?
}

class Characters: Codable {
    var id: Int?
    var name, descript: String?
    var thumbnail: Images?
    var urls: [Url]?
    var comics: ResourceList?
    
    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, urls, comics
        case descript = "description"
    }
}

struct Images: Codable {
    let path, `extension`: String?
}

struct Url: Codable {
    let type, url: String?
}

struct ResourceList: Codable {
    let available, returned: Int?
    let collectionUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case available, returned
        case collectionUrl = "collectionURI"
    }
}

struct Item: Codable {
    let resourceURI, name: String?
}

struct ComicResponse: Codable {
    var code: Int?
    var status: String?
    var data: ComicData?
}

struct ComicData: Codable {
    let results: [Comics]?
}

class Comics: Codable {
    
    var id: Int?
    var title, descript: String?
    var thumbnail: Images?
    var images: [Images]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, images
        case descript = "description"
    }
}


