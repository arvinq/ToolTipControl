//
//  Service.swift
//  PopTip
//
//  Created by Arvin Quiliza on 5/26/19.
//  Copyright © 2019 arvinq. All rights reserved.
//

import Foundation
import UIKit

class Service {
    static let shared = Service()
    
    /**
     Fetch image from image url
     - Parameters:
         - url: Image Url
         - completion: Handler returns UIImage from url
     */
    func fetchImage(usingUrl url: URL?, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = url else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Cannot fetch image", error)
                return
            }
            
            if let data = data {
                
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
                
            } else {
                print("Image Data corrupted")
                return
            }
        }
        
        dataTask.resume()
        
    }
    
}

extension Service: ServiceProtocol {
    
    /**
     Fetches the pugs based on the main url
     - Parameter completion : send pugs to View Model's
     */
    func fetchInfo(completion: @escaping ([Pug]?) -> ()) {
        let urlString = AppProperty.baseUrl
        
        guard let initialUrl = URL(string: urlString),
            let finalUrl = initialUrl.withQuery(items: AppProperty.queryItems)  else { return }
        
        let dataTask = URLSession.shared.dataTask(with: finalUrl) { (data, response, error) in
            
            if let error = error {
                completion(nil)
                print("Failed to fetch data: ", error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonPugs = try JSONDecoder().decode(Pugs.self, from: data)
                let pugs = jsonPugs.data
                
                DispatchQueue.main.async {
                    completion(pugs)
                }
                
            } catch let error {
                print("Failed to decode data: ", error)
                return
            }
        }
        
        dataTask.resume()
        
    }
    
}
