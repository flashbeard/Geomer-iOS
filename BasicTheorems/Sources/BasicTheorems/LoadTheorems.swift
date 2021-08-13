//
//  AddTheorem.swift
//
//
//  Created by GeomerParser.
//
import Foundation

import Core

public var timesSimilarity: [Double] = []
public var timesAngles: [Double] = []

@available(iOS 10.0, *)
public func loadTheorems() {

	// MARK: Test
//	theoremRegistry.add(instances: TestTheorem())
	theoremRegistry.add(instances: TheoremEqualitySegments())
	theoremRegistry.add(instances: TheoremEqualityRays())
	theoremRegistry.add(instances: TheoremEqualityAngles())


	// MARK: EqualityTheorems
	theoremRegistry.add(instances: TheoremEqualityTriangleSideSideSide())
	theoremRegistry.add(instances: TheoremEqualityTriangleSideAngleSide())
	theoremRegistry.add(instances: TheoremEqualityTriangleAngleSideAngle())

	// MARK: SimilarityTheorems
	theoremRegistry.add(instances: TheoremSimilarityTrianglesAngleAngle())
	theoremRegistry.add(instances: TheoremSimilarityTrianglesSideAngleSide())
	theoremRegistry.add(instances: TheoremSimilarityTrianglesSideSideSide())

	// MARK: SearchTheorems
//	theoremRegistry.add(instances: SearchAngle())
//	theoremRegistry.add(instances: SearchRay())
//	theoremRegistry.add(instances: SearchSegment())
//	theoremRegistry.add(instances: SearchTriangle())

}
