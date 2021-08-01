//
//  Proportion.swift
//  
//
//  Created by Daniel Pustotin on 02.05.2021.
//

import Foundation

import Math

enum ProportionError: Error {
	case invalidOperandsCount
}

@available(iOS 10.0, *)
public class Proportion: Node, Expression {

	// MARK: - Properties
	public var operands: [Fraction]

	// MARK: - Initialization
	public init(operands: [Fraction]) throws {
		let n = operands.count
		guard n >= 2 else {
			throw ProportionError.invalidOperandsCount
		}
		
		var paramOperands = operands
		paramOperands.normalize()
		self.operands = paramOperands

		var paramName = ""
		for i in 0 ..< n - 1 {
			paramName += "\(paramOperands[i].name) : "
		}
		paramName += paramOperands.last!.name
		super.init(name: paramName)
	}
}
