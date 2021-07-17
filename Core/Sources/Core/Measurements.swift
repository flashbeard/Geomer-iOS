//
//  Measurements.swift
//  
//
//  Created by Daniel Pustotin on 16.04.2021.
//

import Foundation

@available(iOS 10.0, *) public typealias LengthValue = Measurement<UnitLength>
@available(iOS 10.0, *) public typealias AreaValue = Measurement<UnitArea>
@available(iOS 10.0, *) public typealias AngleValue = Measurement<UnitAngle>

public protocol MeasurementValue {

}

@available(iOS 10.0, *)
extension LengthValue: MeasurementValue {
	public static var zero: LengthValue {
		LengthValue.init(value: 0, unit: .meters)
	}
	
	public static func new(value: Double?) -> LengthValue? {
		value == nil ? nil : LengthValue(value: value!, unit: .meters)
	}
	
	public func info() -> String {
		let str = "\(value)"
		return str
	}
}

@available(iOS 10.0, *)
extension AreaValue {
	public static var zero: AreaValue {
		AreaValue.init(value: 0, unit: .squareMeters)
	}
	
	public static func new(value: Double?) -> AreaValue? {
		value == nil ? nil : AreaValue(value: value!, unit: .squareMeters)
	}
	
	public func info() -> String {
		let str = "\(value)"
		return str
	}
}

@available(iOS 10.0, *)
extension AngleValue {
	public static var zero: AngleValue {
		AngleValue.init(value: 0, unit: .radians)
	}
	
	public static func new(value: Double?) -> AngleValue? {
		value == nil ? nil : AngleValue(value: value!, unit: .degrees)
	}
	
	public func info() -> String {
		let str = "\(value)"
		return str
	}
}
