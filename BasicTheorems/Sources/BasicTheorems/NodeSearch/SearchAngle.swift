//
//  SearchAngle.swift
//  
//
//  Created by Daniel Pustotin on 21.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
internal class SearchAngle: Theorem {
	
	// MARK: Initialization
	
	internal init() {
		super.init(name: "Search angle", description: "", inputTypes: [Ray.self, Ray.self])
	}
	
	// MARK: Methods
	
	internal override func execute() {
		super.execute()
		let ray1 = input[0] as! Ray
		let ray2 = input[1] as! Ray
		
		if ray1 == ray2 {
			result = []
			return
		}
		
		if (ray1.a.equal(ray2.a)) {
			var res: Node
			res = Angle(ray1: ray1, ray2: ray2)
			result.append(res)
		}
		
	}
}
