//
//  Task.swift
//  
//
//  Created by Daniel Pustotin on 17.04.2021.
//

import Foundation

/// Tasks are used for declaration a problem to solve
@available(iOS 10.0, *)
public class Task: Data {
	
	// MARK: Properties
	
	public private (set) var task: Node
	public private (set) var achieved: Bool
	
	// MARK: Initialization
	
	public init(task: Node) {
		self.task = task
		achieved = false
		super.init(isInput: true)
	}
	
	// MARK: Methods
	
	public func achieve() {
		achieved = true
	}
}
