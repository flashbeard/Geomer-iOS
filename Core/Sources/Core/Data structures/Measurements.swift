//
//  Measurements.swift
//  
//
//  Created by Daniel Pustotin on 16.04.2021.
//

import Foundation

@available(iOS 10.0, *) public typealias LinearUnit = Measurement<UnitLength>
@available(iOS 10.0, *) public typealias SquareUnit = Measurement<UnitArea>
@available(iOS 10.0, *) public typealias AngularUnit = Measurement<UnitAngle>

@available(iOS 10.0, *)
public extension LinearUnit {
	static var zero: LinearUnit {
		LinearUnit.init(value: 0, unit: .meters)
	}
	
	static func new(value: Double?) -> LinearUnit? {
		value == nil ? nil : LinearUnit(value: value!, unit: .meters)
	}
	
	var name: String {
		"\(value)"
	}
}

@available(iOS 10.0, *)
extension SquareUnit {
	public static var zero: SquareUnit {
		SquareUnit.init(value: 0, unit: .squareMeters)
	}
	
	public static func new(value: Double?) -> SquareUnit? {
		value == nil ? nil : SquareUnit(value: value!, unit: .squareMeters)
	}
	
	public var name: String {
		"\(value)"
	}
}

@available(iOS 10.0, *)
extension AngularUnit {
	public static var zero: AngularUnit {
		AngularUnit.init(value: 0, unit: .radians)
	}
	
	public static func new(value: Double?) -> AngularUnit? {
		value == nil ? nil : AngularUnit(value: value!, unit: .degrees)
	}
	
	public var name: String {
		"\(value)"
	}
}
