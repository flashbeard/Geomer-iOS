//
//  Task.swift
//  
//
//  Created by Daniel Pustotin on 17.04.2021.
//

import Foundation

/// Tasks are used for declaration a problem to solve
@available(iOS 10.0, *)
public class Task: Data, DataInheritor {
	
	// MARK: - Properties
	public private (set) var task: Node
	public private (set) var achieved: Bool
	
	// MARK: - Initialization
	public init(task: Node) {
		self.task = task
		achieved = false
		super.init()
	}
	
	// MARK: - Methods
	public func achieve() {
		achieved = true
	}

	// MARK: - DataInheritor
	public static func < (lhs: Task, rhs: Task) -> Bool {
		lhs.task < rhs.task
	}

	public static func == (lhs: Task, rhs: Task) -> Bool {
		lhs as Data == rhs as Data && lhs.task == rhs.task
	}

	static func hashValue(for object: Task) -> Int {
		var hasher = Hasher()
		hasher.combine(object.dataTypeString)
		hasher.combine(object.task)
		hasher.combine(object.achieved)
		return hasher.finalize()
	}
}
