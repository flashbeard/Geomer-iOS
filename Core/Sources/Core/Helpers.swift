//
//  Helpers.swift
//  
//
//  Created by Daniel Pustotin on 29.05.2021.
//

import Foundation

public struct Shift {
	public let value: Int
	public let reversed: Bool
	
	public init(_ value: Int = 0, reversed: Bool = false) {
		self.value = value
		self.reversed = reversed
	}
}

extension Array {
	func shifted(by shift: Shift) -> Array<Element> {
		guard self.count > 0, (shift.value % self.count) != 0 else { return shift.reversed ? self.reversed() : self }
		
		let shiftModulo = shift.value % self.count
		let shiftIsNegative = shift.value < 0
		let shiftNormalized = shiftIsNegative ? shiftModulo + self.count : shiftModulo
		
		let performShift: (Int) -> Int = { return $0 + shiftNormalized >= self.count ? $0 + shiftNormalized - self.count : $0 + shiftNormalized }
		
		let res = self.enumerated().sorted(by: { performShift($0.offset) < performShift($1.offset) }).map { $0.element }
		
		return shift.reversed ? res.reversed() : res
	}
}

@available(iOS 10.0, *)
extension Array {
	func equal(_ to: Array) -> Bool {
		if self.count != to.count {
			return false
		}
		for i in 0 ..< self.count {
			let lhs = self[i]
			let rhs = to[i]
			if !(lhs is Node) || !(rhs is Node) {
				return false
			}
			if !(lhs as! Node).equal(rhs as! Node) {
				return false
			}
		}
		return true
	}
}

public struct AnyMetatypeWrapper {
	public let metatype: DataType
}

extension AnyMetatypeWrapper: Equatable {
	public static func ==(lhs: Self, rhs: Self) -> Bool {
		lhs.metatype == rhs.metatype
	}
}

extension AnyMetatypeWrapper: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(metatype))
	}
}

extension Dictionary {
	subscript(_ key: DataType) -> Value? where Key == AnyMetatypeWrapper {
		get { self[AnyMetatypeWrapper(metatype: key)] }
		_modify { yield &self[AnyMetatypeWrapper(metatype: key)] }
	}
}

public typealias DataType = Core.Data.Type
