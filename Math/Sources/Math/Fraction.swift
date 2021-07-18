//
//  File.swift
//  
//
//  Created by Daniel Pustotin on 18.07.2021.
//

import Foundation

/// Fraction is a data structure for algebraic representation of a fractional number as an ordinary fraction.
public struct Fraction: Equatable {
	public private(set) var integer: Int
	public private(set) var numerator: Int
	public private(set) var denumerator: Int

	public init(integer: Int = 0, numerator: Int, denumerator: Int) throws {
		guard denumerator != 0 else {
			throw FractionError.ambiguous
		}
		guard denumerator > 0 else {
			throw FractionError.negativeDenumerator
		}
		self.integer = integer
		self.numerator = numerator
		self.denumerator = denumerator
	}

	public var name: String {
		return (integer == 0 ? "" : String(integer)) +
			(integer == 0 && numerator == 0 ? "0" : "") + 
			(integer == 0 || numerator == 0 ? "" : "(") +
			"\(numerator != 0 ? "\(numerator)/\(denumerator)" : "")" +
			(integer == 0 || numerator == 0 ? "" : ")")
	}

	/// Convertes fraction to mixed _(or just proper)_ fraction.
	public mutating func normalize() {
		let gcd = gcd(a: numerator, b: denumerator)
		numerator /= gcd
		denumerator /= gcd

		integer += numerator / denumerator
		numerator %= denumerator
	}

	/// Convertes fraction to improper fraction.
	/// `integer` part of improper fraction is `0`.
	public mutating func improper() {
		normalize()
		numerator += integer * denumerator
		integer = 0
	}

	/// Multiplies fraction by `Int` value
	/// - Parameter val: value to be multiplied by
	public mutating func multiply(by value: Int) {
		improper()
		numerator *= value
		normalize()
	}

	/// Divides fraction by `Int` value
	/// - Parameter val: value to be divided by
	public mutating func divide(by value: Int) throws {
		guard value != 0 else {
			throw MathOperationError.divisionByZero
		}
		improper()
		numerator *= value.signum()
		denumerator *= abs(value)
		normalize()
	}
}


