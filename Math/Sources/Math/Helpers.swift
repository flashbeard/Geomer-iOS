//
//  Helpers.swift
//  
//
//  Created by Daniel Pustotin on 18.07.2021.
//

import Foundation

extension Array where Element == Fraction {

	/// something
	public mutating func normalize() {
		for var operand in self {
			operand.normalize()
		}
		var g = self[0].denumerator
		var lcm = 1
		for i in 0 ..< self.count {
			self[i].improper()
			g = gcd(a: g, b: self[i].denumerator)
			lcm *= self[i].denumerator
		}

		for i in 0 ..< self.count {
			self[i].multiply(by: lcm / g)
		}

		g = self[0].integer
		for i in 0 ..< self.count {
			g = gcd(a: g, b: self[i].integer)
		}

		for i in 0 ..< self.count {
			try! self[i].divide(by: g)
		}
	}
}

extension Double {
	public func fraction(eps: Double = Double(1e-15)) throws -> Fraction {

		guard self.isFinite else {
			throw FractionError.infinite
		}

		guard !self.isNaN else {
			throw FractionError.ambiguous
		}
		
		let integer = Int(abs(self))
		let num = abs(self) - abs(Double(integer))

		if num < eps {
			return try! Fraction(integer: integer, numerator: 0, denumerator: 1)
		}

		var l = try! Fraction(numerator: 0, denumerator: 1)
		var r = try! Fraction(numerator: 1, denumerator: 1)
		var m = try! Fraction(numerator: 1, denumerator: 2)

		while abs(Double(m.numerator) / Double(m.denumerator) - num) > eps {
			m = try! Fraction(numerator: l.numerator + r.numerator, denumerator: l.denumerator + r.denumerator)

			if Double(m.numerator) / Double(m.denumerator) < num {
				l = m
			} else {
				r = m
			}
		}

		return try! Fraction(integer: integer, numerator: m.numerator, denumerator: m.denumerator)
	}
}
