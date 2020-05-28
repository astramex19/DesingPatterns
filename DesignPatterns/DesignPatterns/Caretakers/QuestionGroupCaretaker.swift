//
//  QuestionGroupCaretaker.swift
//  DesignPatterns
//
//  Created by Fabian Romero Sotelo on 27/05/20.
//  Copyright © 2020 Fabian Romero Sotelo. All rights reserved.
//

import Foundation

final class DiskCaretaker {
    static let decoder = JSONDecoder()
    static let encoder = JSONEncoder()
    
    static func createDocumentURL(withFileName fileName: String) -> URL {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent(fileName).appendingPathExtension("json")
    }
    
    static func save<T: Codable>(_ object: T, to fileName: String) throws {
        let url = createDocumentURL(withFileName: fileName)
        do {
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(object)
            try data.write(to: url)
        } catch (let error) {
            print("Save failed: Object: \(object), Error: \(error)")
            throw error
        }
    }
    
    static func retrieve<T: Codable>(_ type: T.Type, from fileName: String) throws -> T {
        let url = createDocumentURL(withFileName: fileName)
        return try retrieve(type, from: url)
    }
    
    static func retrieve<T: Codable>(_ type: T.Type, from url: URL) throws -> T {
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode(T.self, from: data)
        } catch (let error) {
            print("Retrieve failed: URL: \(url), Error: \(error)")
            throw error
        }
    }
}
