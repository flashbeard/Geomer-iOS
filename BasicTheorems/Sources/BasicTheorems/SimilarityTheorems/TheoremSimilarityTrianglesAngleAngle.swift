//
    //  TheoremSimilarityTrianglesAngleAngle.swift
    //
    //
    //  Created by GeomerParser.
    //

    import Foundation

    import Core

    @available(iOS 10.0, *)
    internal class TheoremSimilarityTrianglesAngleAngle: Theorem {

    	// MARK: - Initialization
    	internal init() {
    		super.init(name: "Theorem Similarity Triangles Angle Angle",
    				   description: "If two angles of one triangle are equal to two angles of another triangle, then such triangles are similar.",
    				   inputTypes: [Triangle.dataType, Triangle.dataType])
    	}

    	// MARK: - Methods
    	internal override func execute() {

            // MARK: Parameters
    		let triangle1 = input[0] as! Triangle
			let triangle2 = input[1] as! Triangle

            // MARK: Preparation
    		if triangle1 == triangle2 {
				return
			}

			let time = DispatchTime.now()
            // MARK: Theorem
    		for i in 0...2 {
				for reversed in [true, false] {
//					let shifted = triangle1.shifted(by: Shift(i, reversed: reversed))
//					let equalityAnglesA = shifted.angle(.A).equal(triangle2.angle(.A))
//					let equalityAnglesB = shifted.angle(.B).equal(triangle2.angle(.B))
//					let equalityAnglesC = shifted.angle(.C).equal(triangle2.angle(.C))
//					if ((equalityAnglesA && equalityAnglesB) || (equalityAnglesB && equalityAnglesC) || (equalityAnglesC && equalityAnglesA)) {
//						result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed)))
//					}
				}
			}
			timesSimilarity.append(Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e9)

    	}
    }
