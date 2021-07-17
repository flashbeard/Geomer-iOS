//
//  File.swift
//  
//
//  Created by Daniel Pustotin on 30.04.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class PropertyNonCommutativeTransitivity<T: BinaryExpression>: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Transitivity property (non commutative)", description: "PropertyNonCommutativeTransitivity", inputTypes: [T.self, T.self])
	}
	
	// MARK: Methods
	
	internal override func execute() {
		super.execute()
		let e1 = input[0] as! T
		let e2 = input[1] as! T
		
		if e1 == e2 {
			result = []
			return
		}
		
		var e: T? = nil
		
		if e1.left == e2.right {
			e = T(left: e1.right, right: e2.left)
		}
		if e1.right == e2.left {
			e = T.init(left: e1.left, right: e2.right)
		}
		
		if e == nil || e!.left == e!.right {
			result = []
			return
		}
		result = [e!]
	}
	
}
