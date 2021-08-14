//
    //  TheoremEqualityTriangleSideAngleSide.swift
    //
    //
    //  Created by GeomerParser.
    //

    import Foundation

    import Core

    @available(iOS 10.0, *)
    internal class TheoremEqualityTriangleSideAngleSide: Theorem {

    	// MARK: - Initialization
    	internal init() {
    		super.init(name: "Theorem Equality Triangle Side Angle Side",
    				   description: "If two sides and the angle between them of one triangle are respectively equal to two sides and the angle between them of another triangle, then such triangles are equal.",
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
					let equalitySidesAB = triangle1.side(.C).equal(triangle2.side(.C))
					let equalitySidesBC = triangle1.side(.A).equal(triangle2.side(.A))
					let equalitySidesCA = triangle1.side(.B).equal(triangle2.side(.B))
					let equalityAnglesA = triangle1.angle(.A).equal(triangle2.angle(.A))
					let equalityAnglesB = triangle1.angle(.B).equal(triangle2.angle(.B))
					let equalityAnglesC = triangle1.angle(.C).equal(triangle2.angle(.C))
					if (equalitySidesAB && equalitySidesBC && equalityAnglesB) || (equalitySidesAB && equalitySidesCA && equalityAnglesA) || (equalitySidesBC && equalitySidesCA && equalityAnglesC) {
						result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed)))
					}
				}
			}
    	}
    }
