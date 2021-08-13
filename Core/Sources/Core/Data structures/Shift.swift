//
//  Shift.swift
//  
//
//  Created by Daniel Pustotin on 29.05.2021.
//

import Foundation

public class Shift {
	public let value: Int
	public let reversed: Bool
	
	public init(_ value: Int = 0, reversed: Bool = false) {
		self.value = value
		self.reversed = reversed
	}

	public var name: String {
		"\(reversed ? "reversed:" : "")\(value)"
	}
}
