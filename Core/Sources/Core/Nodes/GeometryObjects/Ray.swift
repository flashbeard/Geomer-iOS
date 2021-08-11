//
//  Ray.swift
//  
//
//  Created by Daniel Pustotin on 08.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Ray: Line {

	// MARK: - Properties
	public var from: Point
	public var through: Point
	
	// MARK: - Initialization
	public init(from: Point, through: Point) {
		self.from = from
		self.through = through
		super.init(name: "\(from.name)\(through.name)")
	}
}
