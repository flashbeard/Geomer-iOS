//
    //  TheoremEqualityTriangleSideSideSide.swift
    //
    //
    //  Created by GeomerParser.
    //

    import Foundation

    import Core

    @available(iOS 10.0, *)
    internal class TheoremEqualityTriangleSideSideSide: Theorem {

    	// MARK: Initialization
    	internal init() {
    		super.init(name: "Theorem equality triangle side side side",
    				   description: "If three sides of one triangle are equal to three corresponding sides of the other triangle then these triangles are equal to each other",
    				   inputTypes: [Triangle.dataType, Triangle.dataType])
    	}

    	// MARK: Methods
    	internal override func execute() {
    		super.execute()
            // MARK: Parameters
    		let triangle1 = input[0] as! Triangle
			let triangle2 = input[1] as! Triangle

            // MARK: Preparation
    		if triangle1.equal(triangle2) {
				return
			}

            // MARK: Theorem
    		for i in 0...2 {
				for reversed in [true, false] {
					let shifted = triangle1.shifted(by: Shift(i, reversed: reversed))
					let EqualitySidesAB = shifted.side(.AB).equal(triangle2.side(.AB))
					let EqualitySidesBC = shifted.side(.BC).equal(triangle2.side(.BC))
					let EqualitySidesCA = shifted.side(.CA).equal(triangle2.side(.CA))
					if (EqualitySidesAB && EqualitySidesBC && EqualitySidesCA) {
						result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed)))
					}
				}
			}

    	}
    }