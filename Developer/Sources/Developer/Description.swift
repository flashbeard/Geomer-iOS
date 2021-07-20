//
//  Description.swift
//  
//
//  Created by Daniel Pustotin on 20.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
public func description(node: Node, with_references references: Bool = false) -> String {
	let undefined = "Undefined"
	var str = "| {Node} | type: \(node.dataType) | name: \(node.name) |"
	
	switch node.dataTypeString {
	// MARK: - Figure values
	case Perimeter.dataTypeString, Area.dataTypeString:
		let t = node as! Area
		str += " figure: \(t.figure.name) | value: \(t.value?.name ?? undefined) |"
	// MARK: - Geometry objects
	case Point.dataTypeString:
		break
	case Angle.dataTypeString:
		let t = node as! Angle
		str += " vertex: \(t.vertex.name) | value: \(t.value?.name ?? undefined) | rays: [ \(t.r1.name); \(t.r2.name) ] |"
	case Line.dataTypeString:
		let t = node as! Line
		str += " A: \(t.a.name) B: \(t.b.name) |"
	case Ray.dataTypeString:
		let t = node as! Ray
		str += " from: \(t.a.name) through: \(t.b.name) |"
	case Segment.dataTypeString:
		let t = node as! Segment
		str += " A: \(t.a.name) B: \(t.b.name) | length: \(t.value?.name ?? undefined) |"
	// MARK: - Figures
	case Polygon.dataTypeString, Triangle.dataTypeString:
		let t = node as! Polygon
		str += " from: [ "
		for i in 0 ..< t.vertexes.count - 1 {
			str += "\(t.vertexes[i].name); "
		}
		str += "\(t.vertexes.last!.name) ] |"
		
	// MARK: - Binary expression
	case BEBelong.dataTypeString, BEEquality.dataTypeString, BEParallelism.dataTypeString, BEPerpendicularity.dataTypeString:
		break
	case BEPolygonSimilarity.dataTypeString:
		let t = node as! BEPolygonSimilarity
		str += " left shift: \(t.leftShift.name) |"
		str += " proportion: \(t.proportion?.name ?? undefined) |"
	case BEPolygonEquality.dataTypeString:
		let t = node as! BEPolygonEquality
		str += " left shift: \(t.leftShift.name) |"
	default:
		break
	}

	str += "\n"

	return str
}

@available(iOS 10.0, *)
public func description(task: Task) -> String {
	"| {Task} | achieved: \(task.achieved ? "(+) yes" : "(-) no") | task: \(description(node: task.task)) |"
}

@available(iOS 10.0, *)
public func description(theorem: Theorem) -> String {
	let undefined = "Undefined"
	var str = "| {Theorem} |\nname: \(theorem.name) |\ndescription: \(theorem.theoremDescription ?? undefined) |"
	str += " input types: [ "
	for type in theorem.inputTypes {
		str += type.dataTypeString
	}
	str += "] |\nprotocols: "
	if let protocols = theorem.protocols {
		str += " [ "
		for proto in protocols {
			str += String(describing: proto)
		}
		str += " ] |\n"
	} else {
		str += undefined + " |\n"
	}
	return str
}


@available(iOS 10.0, *)
public func description(reference: Reference) -> String {
	let undefined = "Undefined"
	var str = "| {Reference} |\nfrom: "
	if reference.fromNodes.count > 0 {
		str += "["
		for node in reference.fromNodes {
			str += "\(node.name) "
		}
		str += "] |\n"
	} else {
		str += undefined
	}
	return str
}

@available(iOS 10.0, *)
public func descriptionNodeRegistry() {
//	for type in nodeRegistry.dataTypes {
//		print("\(type.metatype.dataTypeString) [\(nodeRegistry.countInstances(for_type: type.metatype)) instances]:")
//		for instance in nodeRegistry.getInstances(for_type: type.metatype) {
//			print("\t\(description(data: instance))")
//			print(referencesDescription(node: instance))
//		}
//	}
}

@available(iOS 10.0, *)
public func descriptionTaskRegistry() {
//	for type in taskRegistry.dataTypes {
//		print("\(type.metatype.dataTypeString):")
//		for instance in taskRegistry.getInstances(for_type: type.metatype) {
//			print("\t\(description(data: instance))")
//		}
//	}
}

@available(iOS 10.0, *)
public func descriptionSolution(solution: Solution, depth: Int = 0) -> String {
	var str = ""
	var depth = 1
	for (node, reference) in solution.steps.reversed() {

		str += String(repeating: "   ", count: depth - 1)
		str += "|\n"
		str += String(repeating: "   ", count: depth - 1)
		str += "|\n"
		str += String(repeating: "   ", count: depth - 1)
		str += "---> "
		str += node.name
		str += "\n"

		if reference != nil {
			depth += 1
		}
	}

	str = String(str.suffix(str.count - 3))

	return str
}
