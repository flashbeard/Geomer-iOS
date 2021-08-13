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

	// MARK: - Properties
	public let name: String
	public let theoremDescription: String?
	public let inputTypes: [DataType]
	public private (set) var input: [Node]!
	public let protocols: [Protocol]?
	public var result: [Node]
	public var usedKits: Set<[Node]>

	// MARK: - Initialization
	public init(name: String, description: String? = nil, inputTypes: [DataType], protocols: [Protocol]? = nil) {
		self.name = name
		self.theoremDescription = description
		self.inputTypes = inputTypes
		self.protocols = protocols
		result = []
		usedKits = []
		theoremRegistry.theoremsOrder.append(Self.dataType)
	}

	// MARK: - Methods
	public func setInput(input: [Node]) {
		self.input = input
	}

	public func apply() {
		guard correctInput() else {
			return
		}
		execute()
		for i in 0 ..< result.count {
			var res = result[i]
			nodeRegistry.find(instance: &res)
			let ref = Reference(from: input, by: self)
			res.addReference(reference: ref)
			nodeRegistry.add(instances: res)
		}
	}

	open func execute() {

	}

	private func correctInput() -> Bool {
		result = []
		if usedKits.contains(input) {
			return false
		}
		usedKits.insert(input)
		return true
	}

	// MARK: - Hashable
	public override func hash(into hasher: inout Hasher) {
		super.hash(into: &hasher)
		hasher.combine(name)
	}
}
