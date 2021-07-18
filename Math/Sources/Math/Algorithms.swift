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
	return b != 0 ? gcd(a: b, b: a % b) : abs(a)
}


