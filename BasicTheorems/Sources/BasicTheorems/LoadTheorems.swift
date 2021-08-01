//
//  AddTheorem.swift
//
//
//  Created by GeomerParser.
//
import Foundation

import Core

@available(iOS 10.0, *)
public func loadTheorems() {

	// MARK: EqualityTheorems
	theoremRegistry.add(instances: TheoremEqualityTriangleSideSideSide())
	theoremRegistry.add(instances: TheoremEqualityTriangleSideAngleSide())
	theoremRegistry.add(instances: TheoremEqualityTriangleAngleSideAngle())

	// MARK: SimilarityTheorems
	theoremRegistry.add(instances: TheoremSimilarityTrianglesAngleAngle())
//	theoremRegistry.add(instances: TheoremSimilarityTrianglesSideAngleSide())
//	theoremRegistry.add(instances: TheoremSimilarityTrianglesSideSideSide())

	// MARK: SearchTheorems
	theoremRegistry.add(instances: SearchAngle())
	theoremRegistry.add(instances: SearchRay())
	theoremRegistry.add(instances: SearchSegment())
	theoremRegistry.add(instances: SearchTriangle())

}
