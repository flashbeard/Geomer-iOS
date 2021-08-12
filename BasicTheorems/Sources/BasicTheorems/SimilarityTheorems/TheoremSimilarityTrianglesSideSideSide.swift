//
    //  TheoremSimilarityTrianglesSideSideSide.swift
    //
    //
    //  Created by GeomerParser.
    //

    import Foundation

    import Core

    @available(iOS 10.0, *)
    internal class TheoremSimilarityTrianglesSideSideSide: Theorem {

    	// MARK: - Initialization
    	internal init() {
    		super.init(name: "Theorem Similarity Triangles Side Side Side",
    				   description: "If the three sides of one triangle are proportional to the three sides of another triangle, then such triangles are similar.",
    				   inputTypes: [Triangle.dataType, Triangle.dataType])
    	}

    	// MARK: - Methods
    	internal override func execute() {

            // MARK: Parameters
    		let triangle1 = input[0] as! Triangle
			let triangle2 = input[1] as! Triangle

            // MARK: Preparation
    		

            // MARK: Theorem
    		for i in 0...2 {
				for reversed in [true, false] {
//					let shifted = triangle1.shifted(by: Shift(i, reversed: reversed))
//					let ratioSidesAB = try? ((shifted.side(.AB).value?.value ?? Double.nan) / (triangle2.side(.AB).value?.value ?? Double.nan)).fraction()
//					let ratioSidesBC = try? ((shifted.side(.BC).value?.value ?? Double.nan) / (triangle2.side(.BC).value?.value ?? Double.nan)).fraction()
//					let ratioSidesCA = try? ((shifted.side(.CA).value?.value ?? Double.nan) / (triangle2.side(.CA).value?.value ?? Double.nan)).fraction()
//					if  ratioSidesAB != nil && ratioSidesAB == ratioSidesBC && ratioSidesBC == ratioSidesCA {
//						result.append(BEPolygonSimilarity(left: triangle1, right: triangle2, leftShift: Shift(i, reversed: reversed), ratio: ratioSidesAB))
//					}
				}
			}

    	}
    }
