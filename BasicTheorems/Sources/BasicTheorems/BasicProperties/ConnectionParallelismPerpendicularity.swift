//
//  ConnectionParallelismPerpendicularity.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class ConnectionParallelismPerpendicularity: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Connection between parallelism and perpendicularity", description: "ConnectionParallelismPerpendicularity", inputTypes: [BEParallelism.self, BEPerpendicularity.self])
	}
	
	// MARK: Methods
	
	internal override func execute() {
		super.execute()
		let e1 = input[0] as! BEParallelism
		let e2 = input[1] as! BEPerpendicularity
		
		if e1 == e2 {
			result = []
			return
		}
		
		var e: BEPerpendicularity? = nil
		
		if e1.left == e2.left {
			e = BEPerpendicularity(left: e1.right, right: e2.right)
		}
		if e1.left == e2.right {
			e = BEPerpendicularity(left: e1.right, right: e2.left)
		}
		if e1.right == e2.left {
			e = BEPerpendicularity(left: e1.left, right: e2.right)
		}
		if e1.right == e2.right {
			e = BEPerpendicularity(left: e1.left, right: e2.left)
		}
		result = e != nil ? [e!] : []
	}
	
}
