//
//  InputData.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

import Math

@available(iOS 10.0, *)
public func loadInputData() {

	let th1 = Theorem(name: "Theorem 1", inputTypes: [Point.self])
	let th2 = Theorem(name: "Theorem 2", inputTypes: [Point.self])

	var ref1 = Reference(from: [], by: th1)
	var ref2 = Reference(from: [], by: th2)

	// should be false
	print(ref1 == ref2)

	ref1 = Reference(from: [], by: th1)
	ref2 = Reference(from: [], by: th1)

	// should be true
	print(ref1 == ref2)

	ref1 = Reference(from: [Point(name: "A")], by: th1)
	ref2 = Reference(from: [Point(name: "A")], by: th1)

	// should be true
	print(ref1 == ref2)

	ref1 = Reference(from: [Point(name: "A")], by: th1)
	ref2 = Reference(from: [Point(name: "B")], by: th1)

	// should be false
	print(ref1 == ref2)
}
