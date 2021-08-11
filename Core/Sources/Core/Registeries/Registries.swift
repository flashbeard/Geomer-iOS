//
//  Registries.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

@available(iOS 10.0, *)
public let nodeRegistry = NodeRegistry.shared
@available(iOS 10.0, *)
public let theoremRegistry = TheoremRegistry.shared
@available(iOS 10.0, *)
public let taskRegistry = TaskRegistry.shared

// MARK: - Registry
/// Data structure for storing any `Data` objects
@available(iOS 10.0, *)
public class Registry<T: Data> {
	
	// MARK: - Properties
	public fileprivate (set) var dataTypes: Set<MetatypeWrapper>
	fileprivate (set) var instances: Dictionary<MetatypeWrapper, Set<T>>
	public fileprivate (set) var newInstances: Dictionary<MetatypeWrapper, Set<T>>
	public fileprivate (set) var hasChanges: Bool
	public var count: Int {
		get {
			var cnt = 0
			for type in dataTypes {
				cnt += instances[type]!.count
			}
			return cnt
		}
	}
	
	// MARK: - Initialization
	fileprivate init() {
		dataTypes = []
		instances = [:]
		newInstances = [:]
		hasChanges = true
	}
	
	// MARK: - Methods
	public func fixState() {
		hasChanges = false
		newInstances = [:]
	}

	public func contains(_ instance: T) -> Bool {
		let type = instance.dataType
		
		return (instances[type] ?? []).contains(instance)
	}

	public func countInstances(for_type type: DataType) -> Int {
		(instances[type] ?? []).count
	}

	public func find(instance: inout T, put: Bool = false) {

		if !contains(instance) && put {
			add(instances: instance)
		} else {
			let type = instance.dataType
			if !(instances[type] ?? []).contains(instance) {
				return
			}
			instance = (instances[type]!)[instances[type]!.firstIndex(of: instance)!]
		}
	}
	
	fileprivate func replace(instance: T) {
		let type = instance.dataType
		
		for tmp in instances[type] ?? [] {
			if tmp == instance {
				let wasChanges = hasChanges
				hasChanges = true
				if let a = tmp as? Node, let b = instance as? Node {
					if a.references == b.references {
						hasChanges = wasChanges
					}
				}
				
				instances[type]!.remove(tmp)
				instances[type]!.insert(instance)
				return
			}
		}
		return
	}
	
	public func getInstances(for_type type: DataType) -> Set<T> {
		instances[type] ?? []
	}
	
	public func getAllInstances() -> Set<T> {
		var union: Set<T> = []
		for set in instances.values {
			union = union.union(set)
		}
		return union
	}
	
	public func instancesCount(for_type type: DataType) -> Int {
		(instances[type] ?? []).count
	}
	
	public func add(instances data: T...) {
		for instance in data {
			
			if contains(instance) {
				replace(instance: instance)
				continue
			}
			
			let type = instance.dataType
			
			if !dataTypes.contains(MetatypeWrapper(metatype: type)) {
				dataTypes.insert(MetatypeWrapper(metatype: type))
				instances[type] = []
			}

			if !newInstances.keys.contains(MetatypeWrapper(metatype: type)) {
				newInstances[type] = []
			}
			
			instances[type]!.insert(instance)
			newInstances[type]!.insert(instance)
			hasChanges = true
		}
	}
	
	public func add(instances data: [T]) {
		for instance in data {
			add(instances: instance)
		}
	}
	
	public func remove(instances data: T...) {
		for var instance in data {
			let type = instance.dataType
			
			if !contains(instance) {
				continue
			}
			
			hasChanges = true
			
			find(instance: &instance)
			
			instances[type]!.remove(instance)
			
			if instances[type]!.count == 0 {
				instances.removeValue(forKey: MetatypeWrapper(metatype: type))
				dataTypes.remove(MetatypeWrapper(metatype: type))
			}
		}
	}
	
	public func remove(instances data: [T]) {
		for instance in data {
			remove(instances: instance)
		}
	}
}

// MARK: - Node registry
/// Registries are used to store data
@available(iOS 10.0, *)
public class NodeRegistry: Registry<Node> {

	// MARK: - Singleton pattern
	static let shared = NodeRegistry()
	
	// MARK: - Methods
	func findEqual(instance: inout Node) {
		let type = instance.dataType
		if !dataTypes.contains(MetatypeWrapper(metatype: type)) {
			return
		}
		instance = instances[type]!.first(where: { $0.equal(instance) }) ?? instance
	}

	public func getKit(for_pattern pattern: [DataType]) -> [[Node]] {

		var kit: [[Node]] = [[]]

		for patternType in pattern {
			var tmpKit: [[Node]] = []
			for line in kit {
//				for type in dataTypes {
//					if type.metatype == patternType {
						for instance in instances[patternType] ?? [] {
							if line.contains(where: { $0 > instance || $0 == instance }) {
								continue
							}
							tmpKit.append(line)
							tmpKit[tmpKit.endIndex - 1].append(instance)
						}
//					}
//				}
			}
			kit = tmpKit
		}

//		var i = 0, j = 1
//
//		while i < kit.count {
//			j = i + 1
//			while j < kit.count {
//				if Set(kit[i]) == Set(kit[j]) || Set(kit[j]).count < kit[j].count {
//					kit.remove(at: j)
//				} else {
//					j += 1
//				}
//			}
//			i += 1
//		}

		// MARK: Print current kit
//		for line in kit {
//			for instance in line {
//				print(instance.name, terminator: " ")
//			}
//			print()
//		}



		return kit
	}
}

// MARK: - Task registry
/// Registries are used to store data
@available(iOS 10.0, *)
public class TaskRegistry: Registry<Task> {
	
	// MARK: - Singleton pattern
	static let shared = TaskRegistry()
	
	// MARK: - Methods
	public var achievedCount: Int {
		var cnt = 0
		for type in dataTypes {
			for task in instances[type]! {
				cnt += task.achieved ? 1 : 0
			}
		}
		return cnt
	}
	
	public var allAchieved: Bool { achievedCount == count }
	
	public func checkAchieved(instances data: Dictionary<MetatypeWrapper, Set<Node>>) {
		for task in instances[Task] ?? [] {
			for node in data[task.task.dataType] ?? [] {
				if task.task.equal(node) {
					task.achieve()
				}
			}
		}
	}

	public override func contains(_ instance: Task) -> Bool {
		let type = instance.task.dataType

		return (instances[type] ?? []).contains(instance)
	}

	public override func add(instances data: Task...) {
		for instance in data {

			if contains(instance) {
				replace(instance: instance)
				continue
			}

			let type = instance.task.dataType

			if !dataTypes.contains(MetatypeWrapper(metatype: type)) {
				dataTypes.insert(MetatypeWrapper(metatype: type))
				instances[type] = []
			}

			if !newInstances.keys.contains(MetatypeWrapper(metatype: type)) {
				newInstances[type] = []
			}

			instances[type]!.insert(instance)
			newInstances[type]!.insert(instance)
			hasChanges = true
		}
	}
	
}

// MARK: - Theorem registry
/// Registries are used to store data
@available(iOS 10.0, *)
public class TheoremRegistry: Registry<Theorem> {
	
	// MARK: - Singleton pattern
	static let shared = TheoremRegistry()
}
