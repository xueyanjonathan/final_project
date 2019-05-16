//
//  Select.swift
//  LaundryApp
//
//  Created by Jonathan on 5/16/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

struct laundry: Codable{
    var name: String
    var time: Double
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let saveURL = documentsDirectory.appendingPathExtension("laundry_file").appendingPathExtension("plist")
    
    static func saveToFile(participants: [laundry]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedName = try? propertyListEncoder.encode(participants)
        try? encodedName?.write(to: saveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [laundry]? {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedName = try? Data(contentsOf:saveURL) {
            if let decodeName = try? propertyListDecoder.decode(Array<laundry>?.self, from: retrievedName) {
                return decodeName
            }
        }
        return nil
    }
}
