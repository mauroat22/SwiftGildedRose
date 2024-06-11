//
//  CommandLineProviderMock.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation
@testable import GildedRose


class CommandLineProviderOneDayMock: CommandLineProviding {
    func getDaysParameter() throws -> Int {
        1
    }
}

class CommandLineProviderErrorMock: CommandLineProviding {
    func getDaysParameter() throws -> Int {
        throw ParamError.parameterNotSupported
    }
}

class CommandLineProviderNoParamMock: CommandLineProviding {
    func getDaysParameter() throws -> Int {
        2
    }
}

