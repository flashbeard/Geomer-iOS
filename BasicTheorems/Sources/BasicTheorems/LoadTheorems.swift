//
//  AddTheorem.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
public func loadTheorems() {

	// MARK: Test
	theoremRegistry.add(instances: TestTheorem())

	// MARK: Transitivity
//	theoremRegistry.add(instances: PropertyCommutativeTransitivity<BEEquality>())
//	theoremRegistry.add(instances: PropertyCommutativeTransitivity<BEParallelism>())
//	theoremRegistry.add(instances: PropertyCommutativeTransitivity<BEEquality>())
//	theoremRegistry.add(instances: PropertyNonCommutativeTransitivity<BEBelong>())
	
	// MARK: Parallelism and Perpendicularity
//	theoremRegistry.add(instances: RuleExclusiveThirdPerpendicularity())
//	theoremRegistry.add(instances: ConnectionParallelismPerpendicularity())
	
	// MARK: Triangle equality
//	theoremRegistry.add(instances: TheoremEqualityTriangleSideSideSide())
//	theoremRegistry.add(instances: TriangleEqualityByTwoSidesAndAngle())
//	theoremRegistry.add(instances: TriangleEqualityByTwoAnglesAndSide())
	
	// MARK: Trinalge similarity
//	theoremRegistry.add(instances: TriangleSimilarityByTwoAngles())
	
	// MARK: Computing theorems
//	theoremRegistry.add(instances: TheoremCosineTriangle())
	
	// MARK: Search
//	theoremRegistry.add(instances: SearchLine())
//	theoremRegistry.add(instances: SearchSegment())
//	theoremRegistry.add(instances: SearchRay())
//	theoremRegistry.add(instances: SearchAngle())
//	theoremRegistry.add(instances: SearchTriangle())
}
