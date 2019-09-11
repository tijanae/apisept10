//
//  ErrorHandling.swift
//  API-Keys-Lab
//
//  Created by Tia Lendor on 9/10/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

enum ErrorHandling: Error {
    case badURL
    case decodingError
    case noData
}
