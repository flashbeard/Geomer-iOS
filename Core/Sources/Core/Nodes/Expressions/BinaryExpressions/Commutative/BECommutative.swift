//
//  BECommutative.swift
//  
//
//  Created by Daniel Pustotin on 30.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BECommutative: BinaryExpression {
	
	// MARK: Initialization
	
	public required init(left: Node, right: Node, isInput: Bool = false) {
		//		if left is Polygon || right is Polygon {
		//			fatalError("Cannot create create \(Self.self) with \(left is Polygon ? type(of: left) : type(of: right))")
		//		}
		var paramLeft = left
		var paramRight = right
		if paramLeft > paramRight {
			swap(&paramLeft, &paramRight)
		}
		super.init(left: paramLeft, right: paramRight, isInput: isInput)
	}
}
