//
//  APIService.swift
//  65AppsTask1
//
//  Created by Григорий Соловьев on 10.03.2019.
//  Copyright © 2019 Григорий Соловьев. All rights reserved.
//

import Foundation

class APIService {
    static func downloadImage(withURL url: URL, completion: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, URLResponse, error) in
            if let data = data {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }.resume()
    }
}
