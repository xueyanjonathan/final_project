//
//  Laundry.swift
//  LaundryApp
//
//  Created by Jonathan on 5/16/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import Foundation

struct Laundry: Codable{
    var name: String
    var time = ""
    
    init(name: String) {
        self.name = name
        time = randomTime()
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let saveURL = documentsDirectory.appendingPathExtension("laundry_file").appendingPathExtension("plist")
    
    static func saveToFile(participants: [Laundry]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedName = try? propertyListEncoder.encode(participants)
        try? encodedName?.write(to: saveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Laundry]? {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedName = try? Data(contentsOf:saveURL) {
            if let decodeName = try? propertyListDecoder.decode(Array<Laundry>?.self, from: retrievedName) {
                return decodeName
            }
        }
        return nil
    }
    
    func randomTime() -> String {
        let listOfTime = ["8:00 - 10:00",
                          "10:00 - 12:00",
                          "12:00 - 14:00",
                          "14:00 - 16:00",
                          "16:00 - 18:00",
                          "18:00 - 20:00"]
        //let luckyTime = listOfTime.randomElement()!
        //let place = listOfTime.firstIndex(of: luckyTime)
        //listOfTime.remove(at: (place)!)
        //return luckyTime
        return listOfTime.randomElement()!
    }
}
