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

	//	theoremRegistry.add(instances: TestTheorem())

	// MARK: Elementary Equality
	theoremRegistry.add(instances: TheoremEqualitySegments())
	theoremRegistry.add(instances: TheoremEqualityRays())
	theoremRegistry.add(instances: TheoremEqualityAngles())

	// MARK: Equality Theorems
	theoremRegistry.add(instances: TheoremEqualityTriangleSideSideSide())
	theoremRegistry.add(instances: TheoremEqualityTriangleSideAngleSide())
	theoremRegistry.add(instances: TheoremEqualityTriangleAngleSideAngle())

	// MARK: Similarity Theorems
	theoremRegistry.add(instances: TheoremSimilarityTrianglesAngleAngle())
	theoremRegistry.add(instances: TheoremSimilarityTrianglesSideAngleSide())
	theoremRegistry.add(instances: TheoremSimilarityTrianglesSideSideSide())
}
