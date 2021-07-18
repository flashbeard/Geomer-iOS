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

// MARK: Registry
/// Registries are used to store data
@available(iOS 10.0, *)
public class Registry<T: Data> {
	
	// MARK: Properties
	
	public private (set) var dataTypes: Set<AnyMetatypeWrapper>
	internal private (set) var instances: Dictionary<AnyMetatypeWrapper, Set<T>>
	public private (set) var newInstances: Set<T>
	public private (set) var hasChanges: Bool
	public var count: Int {
		get {
			var cnt = 0
			for type in dataTypes {
				cnt += instances[type]!.count
			}
			return cnt
		}
	}
	
	// MARK: Initialization
	
	fileprivate init() {
		dataTypes = []
		instances = [:]
		newInstances = []
		hasChanges = true
	}
	
	// MARK: Methods
	
	public func fixState() {
		hasChanges = false
		newInstances = []
	}

	internal func contains(_ instance: T) -> Bool {
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
	
	private func replace(instance: T) {
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
	
	internal func instancesCount(for_type type: DataType) -> Int {
		(instances[type] ?? []).count
	}
	
	public func add(instances data: T...) {
		for instance in data {
			
			if contains(instance) {
				replace(instance: instance)
				continue
			}
			
			let type = instance.dataType
			
			if !dataTypes.contains(AnyMetatypeWrapper(metatype: type)) {
				dataTypes.insert(AnyMetatypeWrapper(metatype: type))
				instances[type] = []
			}
			
			instances[type]!.insert(instance)
			newInstances.insert(instance)
			hasChanges = true
		}
	}
	
	public func add(instances data: [T]) {
		for instance in data {
			add(instances: instance)
		}
	}
	
	internal func remove(instances data: T...) {
		for var instance in data {
			let type = instance.dataType
			
			if !contains(instance) {
				continue
			}
			
			hasChanges = true
			
			find(instance: &instance)
			
			instances[type]!.remove(instance)
			
			if instances[type]!.count == 0 {
				instances.removeValue(forKey: AnyMetatypeWrapper(metatype: type))
				dataTypes.remove(AnyMetatypeWrapper(metatype: type))
			}
		}
	}
	
	internal func remove(instances data: [T]) {
		for instance in data {
			remove(instances: instance)
		}
	}
}

// MARK: Node registry
/// Registries are used to store data
@available(iOS 10.0, *)
public class NodeRegistry: Registry<Node> {
	
	// MARK: Singleton pattern
	internal static let shared = NodeRegistry()
	
	// MARK: Methods
	
	internal func findEqual(instance: inout Node) {
		let type = instance.dataType
		if !dataTypes.contains(AnyMetatypeWrapper(metatype: type)) {
			return
		}
		for tmp in instances[type]! {
			if tmp.equal(instance) {
				instance = tmp
				return
			}
		}
	}

	public func getKit(for_pattern pattern: [DataType], with_protocols protocols: [Protocol]? = nil) -> [[Node]] {

		var kit: [[Node]] = [[]]

		for patternType in pattern {
			var tmpKit: [[Node]] = []
			for line in kit {
				for type in dataTypes {
					if type.metatype.isSubclass(of: patternType) {
						for instance in instances[type] ?? [] {
							tmpKit.append(line)
							tmpKit[tmpKit.endIndex - 1].append(instance)
						}
					}
//					if type.wrappedType.isSubclass(of: patternType) && (protocols == nil || type.wrappedType.conforms(to: protocols![patternIndex])){
//						for instance in instances[type] ?? [] {
//							tmpKit.append(line)
//							tmpKit[tmpKit.endIndex - 1].append(instance)
//						}
//					}
				}
			}
			kit = tmpKit
		}
		return kit
	}
}

// MARK: Task registry
/// Registries are used to store data
@available(iOS 10.0, *)
public class TaskRegistry: Registry<Task> {
	
	// MARK: Singleton pattern
	internal static let shared = TaskRegistry()
	
	// MARK: Methods
	
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
	
	public func checkAchieved(instances data: Set<Node>) {
		for node in data {
			for task in instances[Task] ?? [] {
				if task.task.equal(node) {
					task.achieve()
				}
			}
		}
	}
	
}

// MARK: Theorem registry
/// Registries are used to store data
@available(iOS 10.0, *)
public class TheoremRegistry: Registry<Theorem> {
	
	// MARK: Singleton pattern
	internal static let shared = TheoremRegistry()
}
