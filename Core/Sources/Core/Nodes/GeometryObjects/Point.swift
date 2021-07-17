//
//  Point.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Point: Node, GeometryObject {
	
	// MARK: Initialization
	
	public override init(name: String, isInput: Bool = false) {
		super.init(name: name, isInput: isInput)
	}
	
	public static let staticInit: (() -> ())? = {
		print("Point!!")
	}
	
}
