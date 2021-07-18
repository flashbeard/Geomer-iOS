//
//  BECommutative.swift
//  
//
//  Created by Daniel Pustotin on 30.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BECommutative: BinaryExpression {
	
	// MARK: - Initialization
	public required init(left: Node, right: Node, isInput: Bool = false) {
		var paramLeft = left
		var paramRight = right
		if paramLeft > paramRight {
			swap(&paramLeft, &paramRight)
		}
		super.init(left: paramLeft, right: paramRight, isInput: isInput)
	}
}
