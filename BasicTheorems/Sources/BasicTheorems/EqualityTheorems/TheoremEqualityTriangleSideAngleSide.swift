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
				for reversed in [true, false] {
					let shifted = triangle1.shifted(by: Shift(i, reversed: reversed))
					let EqualitySidesAB = shifted.side(.AB).equal(triangle2.side(.AB))
					let EqualitySidesBC = shifted.side(.BC).equal(triangle2.side(.BC))
					let EqualitySidesCA = shifted.side(.CA).equal(triangle2.side(.CA))
					let EqualityAnglesA = shifted.angle(.A).equal(triangle2.angle(.A))
					let EqualityAnglesB = shifted.angle(.B).equal(triangle2.angle(.B))
					let EqualityAnglesC = shifted.angle(.C).equal(triangle2.angle(.C))
					if (EqualitySidesAB && EqualitySidesBC && EqualityAnglesB) || (EqualitySidesAB && EqualitySidesCA && EqualityAnglesA) || (EqualitySidesBC && EqualitySidesCA && EqualityAnglesC) {
						result.append(BEPolygonEquality(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed)))
					}
				}
			}

    	}
    }
