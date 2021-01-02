//
//  Entities.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 11/21/20.
//

import Foundation

//MARK: - CharacterResponse
struct Response: Codable {
    var code: Int?
    var status, attributionText: String?
    var data: MarvelData?
}

//MARK: - CharacterArray
struct MarvelData: Codable {
    let count, limit, offset: Int?
    let results: [Characters]?
}

//MARK: - CharacterModel
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

struct Url: Codable {
    let type, url: String?
}

struct Item: Codable {
    let resourceURI, name, role: String?
}

//MARK: - ComicResponse
struct ComicResponse: Codable {
    var code: Int?
    var status: String?
    var data: ComicData?
}

//MARK: - ComicArray
struct ComicData: Codable {
    let results: [Comics]?
}

//MARK: - ComicModel
class Comics: Codable {
    
    var id: Int?
    var title, descript, alternative, format: String?
    var creators: ResourceList?
    var thumbnail: Images?
    var images: [Images]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, images, format, creators
        case descript = "description"
        case alternative = "variantDescription"
    }
}

//MARK: - Images
struct Images: Codable {
    let path, `extension`: String?
}

struct ResourceList: Codable {
    let available, returned: Int?
    let items: [Item]?
    let collectionUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case available, returned, items
        case collectionUrl = "collectionURI"
    }
}
