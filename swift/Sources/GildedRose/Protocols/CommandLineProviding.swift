//
//  CommandLineProviding.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

public protocol CommandLineProviding {
    func getDaysParameter() throws -> Int
}
