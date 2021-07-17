//
//  BEBelong.swift
//  
//
//  Created by Daniel Pustotin on 07.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class BEBelong: BinaryExpression {
	
	// MARK: Properties
	
	public override class var sign: String { "∈" }
	
	// MARK: Initialization
	
	public required init(left: Node, right: Node, isInput: Bool = false) {
		super.init(left: left, right: right, isInput: isInput)
	}
}
