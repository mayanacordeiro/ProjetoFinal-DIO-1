//
//  API.swift
//  DogsBreeds
//
//  Created by mcor on 14/10/23.
//

import Foundation

struct API {
    
    typealias BreedsListCompletion = ([String]?, Error?) -> Void
    
    func getBreedsList(completion: @escaping BreedsListCompletion) {
        
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let message = json?["message"] as? [String: Any] {
                    let breeds = message.keys.sorted()
                    completion(breeds, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    

}

struct BreedImagesAPI {

    func getImages(for breed: String, completion: @escaping ([String]?, Error?) -> Void) {

        guard let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let images = json?["message"] as? [String] {
                    completion(images, nil)
                }
            } catch {
                completion(nil, error)
            }
        }

        task.resume()
    }
}

struct SearchBreeds {

    func fetchBreedImages(for breed: String, completion: @escaping ([String]?, Error?) -> Void) {

        guard let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let images = json?["message"] as? [String] {
                    completion(images, nil)
                }
            } catch {
                completion(nil, error)
            }
        }

        task.resume()
    }
}

