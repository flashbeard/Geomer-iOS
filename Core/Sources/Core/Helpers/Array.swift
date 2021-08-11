//
//  Array.swift
//  
//
//  Created by Daniel Pustotin on 18.07.2021.
//

import Foundation

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

//	func shifted(by shift: Shift) -> Array<Element> {
//		guard self.count > 0, (shift.value % self.count) != 0 else { return shift.reversed ? self.reversed() : self }
//
//		let shiftModulo = shift.value % self.count
//		let shiftIsNegative = shift.value < 0
//		let shiftNormalized = shiftIsNegative ? shiftModulo + self.count : shiftModulo
//
//		let performShift: (Int) -> Int = { return $0 + shiftNormalized >= self.count ? $0 + shiftNormalized - self.count : $0 + shiftNormalized }
//
//		let res = self.enumerated().sorted(by: { performShift($0.offset) < performShift($1.offset) }).map { $0.element }
//
//		return shift.reversed ? res.reversed() : res
//	}
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
