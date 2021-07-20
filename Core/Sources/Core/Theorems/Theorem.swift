//
//  Theorem.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

/// Theorem is a tool to produce new data from some input by some rule
@available(iOS 10.0, *)
open class Theorem: Data, DataInheritor {





	// MARK: - Properties
	public let name: String
	public let theoremDescription: String?
	public let inputTypes: [DataType]
	public var input: [Node]!
	public var protocols: [Protocol]?
	public var result: [Node]

	// MARK: - Initialization
	public init(name: String, description: String? = nil, inputTypes: [DataType], protocols: [Protocol]? = nil) {
		self.name = name
		self.theoremDescription = description
		self.inputTypes = inputTypes
		self.protocols = protocols
		result = []
	}

	// MARK: - Methods
	public func apply() {
		checkInput()
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

	}

	private func checkInput() {
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
	}

	// MARK: - DataInheritor
	public static func < (lhs: Theorem, rhs: Theorem) -> Bool {
		lhs.name < rhs.name || lhs.name == rhs.name && lhs.theoremDescription ?? "" < rhs.theoremDescription ?? ""
	}

	public static func == (lhs: Theorem, rhs: Theorem) -> Bool {
		lhs as Data == rhs as Data && lhs.name == rhs.name && lhs.theoremDescription == rhs.theoremDescription
	}

	static func hashValue(for object: Theorem) -> Int {
		var hasher = Hasher()
		hasher.combine(object.dataTypeString)
		hasher.combine(object.name)
		hasher.combine(object.theoremDescription)
		hasher.combine(object.inputTypes.map({ $0.dataTypeString }))
		hasher.combine(object.protocols.map({ String(describing: $0) }))
		return hasher.finalize()
	}
}
