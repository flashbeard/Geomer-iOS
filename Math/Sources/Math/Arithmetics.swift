//
//  Arithmetics.swift
//  
//
//  Created by Daniel Pustotin on 05.05.2021.
//

import Foundation

public func gcd(a: Int, b: Int) -> Int {
	if a == 0 && b == 0 {
		return 1
	}
	return b != 0 ? gcd(a: b, b: a % b) : a
}

public struct Fraction: Equatable {
	public var sign: Int
	public var integer: Int
	public var numerator: Int
	public var denumerator: Int

	public init(sign: Int = 1, integer: Int = 0, numerator: Int, denumerator: Int) {
		self.sign = sign.signum()
		self.integer = integer
		self.numerator = numerator
		self.denumerator = denumerator
	}

	public var name: String {
		var str = "\(sign >= 0 ? "" : "-")"
		str += "\(integer == 0 ? "" : String(integer))"
		str += "\(integer != 0 && numerator != 0 ? " " : "")"
		str += "\(numerator == 0 ? "" : "\(numerator)/\(denumerator)")"
		return str
	}

	public mutating func multiply(by val: Int) {
		sign *= val.signum()

		numerator += integer * denumerator
		integer = 0
		numerator *= abs(val)

		self.normalize()
	}

	public mutating func divide(by val: Int) {
		sign *= val.signum()

		numerator += integer * denumerator
		integer = 0
		denumerator *= abs(val)

		self.normalize()
	}

	public mutating func normalize() {
		let gcd = gcd(a: numerator, b: denumerator)
		numerator /= gcd
		denumerator /= gcd

		integer += numerator / denumerator
		numerator %= denumerator
	}

	public static func normalize(operands: inout [Fraction]) {
		for var operand in operands {
			operand.normalize()
		}
		var g = operands[0].denumerator
		var lcm = 1
		for i in 0 ..< operands.count {
			operands[i].numerator += operands[i].integer * operands[i].denumerator
			operands[i].integer = 0
			g = gcd(a: g, b: operands[i].denumerator)
			lcm *= operands[i].denumerator
		}

		for i in 0 ..< operands.count {
			operands[i].multiply(by: lcm / g)
		}

		g = operands[0].integer
		for i in 0 ..< operands.count {
			g = gcd(a: g, b: operands[i].integer)
		}

		for i in 0 ..< operands.count {
			operands[i].divide(by: g)
		}
	}
}

extension Double {
	public func fraction(eps: Double = Double(1e-15)) -> Fraction {

		if self.isInfinite || self.isNaN {
			fatalError("\(self) cannot be converted to the fraction")
		}
		let sign = self < 0 ? -1 : 1
		let integer = Int(abs(self))
		let num = abs(self) - abs(Double(integer))

		if num < eps {
			return Fraction(sign: sign, integer: integer, numerator: 0, denumerator: 1)
		}

		var l = Fraction(numerator: 0, denumerator: 1)
		var r = Fraction(numerator: 1, denumerator: 1)
		var m = Fraction(numerator: 1, denumerator: 2)

		while abs(Double(m.numerator) / Double(m.denumerator) - num) > eps {
			m.numerator = l.numerator + r.numerator
			m.denumerator = l.denumerator + r.denumerator

			if Double(m.numerator) / Double(m.denumerator) < num {
				l = m
			} else {
				r = m
			}
		}

		m.sign = sign
		m.integer = integer
		return m
	}
}
