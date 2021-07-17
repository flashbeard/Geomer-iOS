//
//  Figure.swift
//  
//
//  Created by Daniel Pustotin on 16.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public protocol Figure: GeometryObject {
	var area: Area? { get set }
	var perimeter: Perimeter? { get set }
}
