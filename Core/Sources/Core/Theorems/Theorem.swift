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

	// MARK: - Initialization
	public init(name: String, description: String? = nil, inputTypes: [DataType], protocols: [Protocol]? = nil) {
		self.name = name
		self.theoremDescription = description
		self.inputTypes = inputTypes
		self.protocols = protocols
		result = []
	}

	// MARK: - Methods
	public func setInput(input: [Node]) {
		self.input = input
	}

	public func apply() {
		let testPrint = false
//			name == "Theorem Equality triangle side side side"
		var time = DispatchTime.now()
		checkInput()
		if testPrint { print("\tapply:: check elapsed time:", Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e6, "(ms)") }
		time = DispatchTime.now()
		execute()
		if testPrint { print("\tapply:: execute elapsed time:", Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e6, "(ms)") }
		time = DispatchTime.now()
		for i in 0 ..< result.count {
			var res = result[i]
			nodeRegistry.find(instance: &res)
			let ref = Reference(from: input, by: self)
			res.addReference(reference: ref)
			result[i] = res
		}
		if testPrint { print("\tapply:: result check elapsed time:", Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e6, "(ms)") }
		time = DispatchTime.now()
		nodeRegistry.add(instances: result)
		if testPrint { print("\tapply:: add result elapsed time:", Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e6, "(ms)") }
		time = DispatchTime.now()
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
		result = []
	}

	// MARK: - Hashable
	public override func hash(into hasher: inout Hasher) {
		super.hash(into: &hasher)
		hasher.combine(name)
	}
}
