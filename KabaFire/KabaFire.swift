//
//  KabaFire.swift
//  KabaFire
//
//  Created by IPG on 2020/11/22.
//  Copyright © 2020 Taiki Kabaya. All rights reserved.
//

import Foundation
import UIKit

public class KabaFire {
    public static let name = "kabaya"
    
    public static func get<T: Codable>(url: String, model: T.Type, completion: @escaping(T) -> Void) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!) {(data, response, error) in
            guard let data = data else { return }
            let json: String = String(data: data, encoding: .utf8)!
            let jsonData = json.data(using: .utf8)!
            
            do {
                let value: T = try JSONDecoder().decode(T.self, from: jsonData)
                completion(value)
            } catch {
                // noop
            }
        }

        task.resume()
    }
}
