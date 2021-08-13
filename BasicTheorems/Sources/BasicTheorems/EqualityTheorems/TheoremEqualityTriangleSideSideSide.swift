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

    	// MARK: - Initialization
    	internal init() {
    		super.init(name: "Theorem Equality Triangle Side Side Side",
    				   description: "If three sides of one triangle are equal to three corresponding sides of the other triangle then these triangles are equal to each other",
    				   inputTypes: [Triangle.dataType, Triangle.dataType])
    	}

    	// MARK: - Methods
    	internal override func execute() {

            // MARK: Parameters
    		let triangle1 = input[0] as! Triangle
			let triangle2 = input[1] as! Triangle

            // MARK: Preparation
    		if triangle1.equal(triangle2) {
				return
			}

            // MARK: Theorem
			for i in 0...2 {
				triangle1.shift(by: Shift(1))
				for reversed in [true, false] {
					triangle1.shift(by: Shift(reversed: true))
					let equalitySidesAB = triangle1.side(.AB).equal(triangle2.side(.AB))
					let equalitySidesBC = triangle1.side(.BC).equal(triangle2.side(.BC))
					let equalitySidesCA = triangle1.side(.CA).equal(triangle2.side(.CA))
					if (equalitySidesAB && equalitySidesBC && equalitySidesCA) {
						result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift((i + 1) % 3, reversed: reversed)))
					}
				}
			}

    	}
    }
