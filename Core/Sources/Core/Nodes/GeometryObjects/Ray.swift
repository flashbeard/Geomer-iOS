//
//  Ray.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Ray: Line {
	
	// MARK: - Initialization
	public init(from a: Point, through b: Point, isInput: Bool = false) {
		super.init(a: a, b: b, commutative: false, isInput: isInput)
	}
}
