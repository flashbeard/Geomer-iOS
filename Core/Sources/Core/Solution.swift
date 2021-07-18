//
//  Solution.swift
//  
//
//  Created by Daniel Pustotin on 15.05.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Solution {
	
	// MARK: Properties
	
	public let problem: Node
	public private (set) var steps: [(node: Node, reference: Reference?)]
	
	// MARK: Initialization
	
	public init(for problem: Node) {
		self.problem = problem
		steps = []
	}

	// MARK: Methods
	public func backtrack() {
		if problem.isInput {
			steps = [(node: problem, reference: nil)]
			return
		}

		for reference in problem.references {
			var fromSteps: [(node: Node, reference: Reference?)] = []
			for fromNode in reference.fromNodes {
				let fromNodeSolution = Solution(for: fromNode)
				fromNodeSolution.backtrack()
				fromSteps.append(contentsOf: fromNodeSolution.steps)
			}
			if steps.count == 0 || steps.count - 1 > fromSteps.count {
				steps = fromSteps
				steps.append((node: problem, reference: reference))
			}
		}
	}
}


