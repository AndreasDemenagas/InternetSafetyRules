//
//  Rule+BundleExtension.swift
//  InternetRules
//
//  Created by Andrew Demenagas on 25/1/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

struct Rule: Decodable {
    let id: String
    let text: String
}


extension Bundle {
    func decode<T: Decodable>(type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError()
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from Bundle")
        }
        
        return loaded
    }
}
