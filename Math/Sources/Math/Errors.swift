//
//  Errors.swift
//  
//
//  Created by Daniel Pustotin on 18.07.2021.
//

import Foundation

enum FractionError: Error {
	case ambiguous
	case infinite
	case negativeDenumerator
}

enum MathOperationError: Error {
	case divisionByZero
}
