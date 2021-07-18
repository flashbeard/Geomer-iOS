//
//  Proportion.swift
//  
//
//  Created by Daniel Pustotin on 02.05.2021.
//

import Foundation

import Math

@available(iOS 10.0, *)
public class Proportion: Node, Expression {

	// MARK: Properties

	public var operands: [Fraction]

	// MARK: Initialization

	public init(operands: [Fraction], isInput: Bool = false) {
		let n = operands.count
		if  n < 2 {
			fatalError("Proportion can not have \(n) operands")
		}
		var paramOperands = operands
		Fraction.normalize(operands: &paramOperands)
		self.operands = paramOperands

		var paramName = ""
		for i in 0 ..< n - 1 {
			paramName += "\(paramOperands[i].name) : "
		}
		paramName += paramOperands.last!.name
		super.init(name: paramName, isInput: isInput)
	}
}
