//
//  Theorem.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

/// Theorem is a tool to produce new data from some input by some rule
@available(iOS 10.0, *)
open class Theorem: Data {

	// MARK: Properties

	public let theoremDescription: String
	public let inputTypes: [DataType]
	public var input: [Node]!
	public var protocols: [Protocol]?
	public var result: [Node]!

	// MARK: Initialization

	public init(name: String, description: String, inputTypes: [DataType], protocols: [Protocol]? = nil) {
		self.theoremDescription = description
		self.inputTypes = inputTypes
		self.protocols = protocols
		super.init(name: name)
	}

	// MARK: Methods

	public func apply() {
		execute()
		for i in 0 ..< result.count {
			var res = result[i]
			nodeRegistry.find(instance: &res)
			let ref = Reference(from: input, by: self)
			res.addReference(reference: ref)
			result[i] = res
		}
		nodeRegistry.add(instances: result)
	}

	open func execute() {
		if input == nil {
			fatalError("No inputs provided for theorem \(name)")
		}
		if input.count != inputTypes.count {
			fatalError("Wrong number of inputs for theorem \(name)")
		}
		for i in 0 ..< input.count {
			if input[i].dataType != inputTypes[i] {
				fatalError("Wrong types of inputs for theorem \(name)")
			}
		}
		result = []
	}
}
