////
////  CatFactsService.swift
////  CatsFacts
////
////  Created by Marius on 2023-11-13.
////
//
//import Foundation
//
//enum APIError: Error {
//    case requestFailed(reason: String?)
//    case parsingFailed
//}
//
//class Networking<T: Decodable> {
//    
//    let urlString = URL(string: "https://catfact.ninja/fact")
//
//    static func loadData(urlString: String, completion: @escaping (Result<T, APIError>) -> ()) {
//        Networking.performRequest(urlString: urlString) { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let decoder = JSONDecoder()
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    let object = try decoder.decode(T.self, from: data)
//                    completion(.success(object))
//                } catch {
//                    completion(.failure(.parsingFailed))
//                }
//            case .failure(let apiError):
//                completion(.failure(apiError))
//            }
//        }
//    }
//    
//    private static func performRequest(urlString: String, completion: @escaping (Result<Data, APIError>) -> ()) {
//        guard let url = URL(string: urlString)  else { return }
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            if let data = data {
//                completion(.success(data))
//            } else {
//                completion(.failure(.requestFailed(reason: error?.localizedDescription)))
//            }
//        }
//        task.resume()
//    }
//    
//    
//    
//    
//}
