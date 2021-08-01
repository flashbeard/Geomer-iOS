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

	let a = Point(name: "A")
	let b = Point(name: "B")
	let c = Point(name: "C")
	let d = Point(name: "D")

	nodeRegistry.add(instances: a, b, c, d)

	let abc = Angle(a: a, b: b, c: c, value: AngularUnit.new(value: 60))
	let bac = Angle(a: b, b: a, c: c, value: AngularUnit.new(value: 30))

	let abd = Angle(a: a, b: b, c: d, value: AngularUnit.new(value: 60))
	let bad = Angle(a: b, b: a, c: d, value: AngularUnit.new(value: 30))

	nodeRegistry.add(instances: abc, bac, abd, bad)

}
