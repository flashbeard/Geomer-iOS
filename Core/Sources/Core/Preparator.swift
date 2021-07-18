//
//  Preparator.swift
//  
//
//  Created by Daniel Pustotin on 04.07.2021.
//

import Foundation
import SwiftUI

public enum PropertyType {
	case text
	case number
	case textOptional
	case numberOptional
}

@available(iOS 13.0, *)
public class Preparator: ObservableObject {

	public var propertyCount: Int {
		propertyNames.count
	}
	public class func propertyNames() -> [String] {
		[]
	}
	public class func propertyTypes() -> [PropertyType] {
		[]
	}
	@Published public var propertyValues: Dictionary<String, String> = [:]

	public var propertyNames: [String] { Self.propertyNames() }
	public var propertyTypes: [PropertyType] { Self.propertyTypes() }

	public func prepare() -> Node? {
		nil
	}

	public init() {
		for key in propertyNames {
			propertyValues[key] = ""
		}
	}

	public func binding(for key: String) -> Binding<String> {
		return Binding(
			get: { [self] in
				return propertyValues[key]!
			},
			set: { [self] newValue in
				propertyValues[key] = newValue
			})
	}
}

@available(iOS 13.0, *)
public class PointPreparator: Preparator {

	public override class func propertyNames() -> [String] {
		["Name"]
	}

	public override class func propertyTypes() -> [PropertyType] {
		[.text]
	}

	public override func prepare() -> Node? {
		let propertyName = propertyValues["Name"]!
		if propertyName.isEmpty {
			return nil
		}
		return Point(name: propertyValues["Name"]!,
					 isInput: true)
	}
}

@available(iOS 13.0, *)
public class LinePreparator: Preparator {

	public override class func propertyNames() -> [String] {
		["PointA", "PointB"]
	}

	public override class func propertyTypes() -> [PropertyType] {
		[.text, .text]
	}

	public override init() {
		super.init()
	}

	public override func prepare() -> Node? {
		let propertyPointA = propertyValues["PointA"]!
		let propertyPointB = propertyValues["PointB"]!
		if propertyPointA.isEmpty || propertyPointB.isEmpty {
			return nil
		}
		return Line(a: Point(name: propertyPointA, isInput: true),
					b: Point(name: propertyPointB, isInput: true),
					isInput: true)
	}
}

@available(iOS 13.0, *)
public class SegmentPreparator: Preparator {

	public override class func propertyNames() -> [String] {
		["PointA", "PointB", "LengthValue"]
	}

	public override class func propertyTypes() -> [PropertyType] {
		[.text, .text, .numberOptional]
	}

	public override init() {
		super.init()
	}

	public override func prepare() -> Node? {
		let propertyPointA = propertyValues["PointA"]!
		let propertyPointB = propertyValues["PointB"]!
		let propertyLenght = Double(propertyValues["LengthValue"]!)
		if propertyPointA.isEmpty || propertyPointB.isEmpty || propertyLenght ?? 0 < 0 || propertyLenght == nil && propertyValues["LengthValue"] != "" {
			return nil
		}
		return Segment(a: Point(name: propertyPointA, isInput: true),
					   b: Point(name: propertyPointB, isInput: true),
					   length: LinearUnit.new(value: propertyLenght),
					   isInput: true)
	}
}

@available(iOS 10.0, *)
public class PreparatorRegistry {

	@available(iOS 13.0, *)
	private static var registry: Dictionary<String, Preparator> = [
		Point.dataTypeString : PointPreparator(),
		Line.dataTypeString : LinePreparator(),
		Segment.dataTypeString: SegmentPreparator(),
	]

	//	@available(iOS 13.0, *)
	//	public static func setPreparator(type: DataType, preparator: Preparator) {
	//		registry[type] = preparator
	//	}

	@available(iOS 13.0, *)
	public static func getPreparator(type: DataType) -> Preparator {
		registry[type.dataTypeString] ?? Preparator()
	}
}
