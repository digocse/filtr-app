//
//  Stub.swift
//  FiltrTests
//
//  Created by Rodrigo de Sousa Santos on 29/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import Foundation

class Stub {
    static func response(from filename: String) -> Data {
        guard let path = Stub.path(from: filename, ofType: "json") else {
            fatalError("Could not find a stubbed archive with filename: \(filename)")
        }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            fatalError("Could not load a stubbed response with filename: \(filename)\n" +
                "At path: \(path)\nError: \(error.localizedDescription)")
        }
    }
    
    static func path(from filename: String, ofType type: String) -> String? {
        let bundle = Bundle(for: Stub.self)
        if let path = bundle.path(forResource: filename, ofType: type, inDirectory: "FiltrTests.bundle") {
            return path
        }
        if let path = bundle.path(forResource: filename, ofType: type) {
            return path
        }
        return nil
    }
}
