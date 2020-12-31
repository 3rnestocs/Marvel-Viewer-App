//
//  Service.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 11/20/20.
//

//import Alamofire
//
//class APIManager {
//    
//    let baseUrl = "https://gateway.marvel.com/v1/public/characters"
//    let limit = 40
//    var offset = 0
//    
//    typealias CharactersCallback = ([Characters]) -> Void
//    
//    func getCharacters(shouldPage: Bool,
//                       handler: @escaping CharactersCallback) {
//        
//        let mainCharacters = [Characters]()
//        let nextCharacters = [Characters]()
//        let url             = buildUrl(shouldPage: shouldPage)
//        
//        if shouldPage {
//            mainApiCall(mainList: nextCharacters, endpoint: url) { (result) in
//                switch result {
//                case .success(let characters):
//                    handler(characters)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        } else {
//            mainApiCall(mainList: mainCharacters, endpoint: url) { (result) in
//                switch result {
//                case .success(let characters):
//                    handler(characters)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        }
//    }
//    
//    private func buildUrl(shouldPage: Bool = false) -> String {
//        
//        var endpoint = "\(baseUrl)?\(params)&limit=\(limit)"
//        
//        if shouldPage {
//            offset += limit
//            endpoint = endpoint + "&offset=\(offset)"
//        }
//        return endpoint
//    }
//
//    private func mainApiCall(mainList: [Characters], endpoint: String,
//                     handler: @escaping (Result<[Characters], Error>) -> Void) {
//        
//        var characterArray = mainList
//        AF.request(endpoint).validate().responseMarvel { (response) in
//            
//            do {
//                guard let serverResponse = response.value,
//                      let marvelData = serverResponse.data,
//                      let characters = marvelData.results
//                else { return }
//
//                characterArray = characters.filter {
//                    $0.thumbnail?.path != withoutImage &&
//                    $0.name!.count < 20 &&
//                    $0.thumbnail!.extension != "gif" &&
//                    $0.name! != "Blob"
//                }
//                
//                characterArray.sort { (char1, char2) -> Bool in
//                    return char1.name! < char2.name!
//                }
//                
//                handler(.success(characterArray))
//            } catch {
//                print("DEBUG: THERE WAS AN ERROR LOADING THE DATA --- IT WAS: \(error)")
//            }
//        }
//    }
//    
//    func getComics(resourceUrl: String,
//                           handler: @escaping (Result<[Comics], Error>) -> Void) {
//
//        let comicEndpoint = "\(resourceUrl)?\(params)"
//
//        AF.request(comicEndpoint).validate().responseComic { (response) in
//
//            do {
//                guard let serverResponse = response.value,
//                      let comicData = serverResponse.data,
//                      let comics = comicData.results
//                else { return }
//
//                handler(.success(comics))
//            } catch {
//                print("DEBUG ERROR: \(error)")
//            }
//        }
//    }
//}
//
//extension DataRequest {
//
//    @discardableResult
//    func responseMarvel(queue: DispatchQueue? = nil, completionHandler: @escaping (AFDataResponse<Response>) -> Void) -> Self {
//        return responseDecodable(queue: queue ?? .main, completionHandler: completionHandler)
//    }
//    
//    @discardableResult
//    func responseComic(queue: DispatchQueue? = nil, completionHandler: @escaping (AFDataResponse<ComicResponse>) -> Void) -> Self {
//        return responseDecodable(queue: queue ?? .main, completionHandler: completionHandler)
//    }
//}
