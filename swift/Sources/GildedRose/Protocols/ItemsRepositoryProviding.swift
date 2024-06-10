//
//  ItemsRepositoryProviding.swift
//
//
//  Created by Mauro Bianchelli on 2024-06-10.
//

import Foundation

public protocol ItemsRepositoryProviding: AnyObject {
    var items: [Itemable] { get }
}
