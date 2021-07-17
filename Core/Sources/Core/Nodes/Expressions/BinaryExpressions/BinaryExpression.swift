//
//  BinaryExpression.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BinaryExpression: Node, Expression {
	
	// MARK: Properties
	
	public var left, right: Node
	public class var sign: String { "🏳️‍🌈" }
	
	// MARK: Initialization
	
	public required init(left: Node, right: Node, isInput: Bool = false) {
		
		self.left = left
		self.right = right
		
		let paramName = "\(left.info()) \(type(of: self).sign) \(right.info())"
		super.init(name: paramName, isInput: isInput)
	}
}
