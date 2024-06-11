//
//  CommandLineProvider.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

public enum ParamError: Error {
    case parameterNotSupported
}

public class CommandLineProvider: CommandLineProviding {
    struct Const {
        static let defaultValue = 2
    }

    public init() {}
    
    public func getDaysParameter() throws -> Int {
        guard CommandLine.argc > 1 else { return Self.Const.defaultValue }

        guard let parameterValue = Int(CommandLine.arguments[1]) else {
            throw ParamError.parameterNotSupported
        }
        return parameterValue
    }
}
