//
//  ItemsRepositoryMock.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation
@testable import GildedRose


class CommandLineProviderOneDayMock: CommandLineProviderProtocol {
    func getDaysParameter() throws -> Int {
        1
    }
}

class CommandLineProviderErrorMock: CommandLineProviderProtocol {
    func getDaysParameter() throws -> Int {
        throw ParamError.parameterNotSupported
    }
}

class CommandLineProviderNoParamMock: CommandLineProviderProtocol {
    func getDaysParameter() throws -> Int {
        2
    }
}

