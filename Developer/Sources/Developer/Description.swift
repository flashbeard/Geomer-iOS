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
	var str = "| {\(node.dataType)} | name: \(node.name) |"
	
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
		str += " points: [ "
		for p in t.points {
			str += "\(p.name) "
		}
		str += "] |"
	case Ray.dataTypeString:
		let t = node as! Ray
		str += " from: \(t.from.name) through: \(t.through.name) |"
	case Segment.dataTypeString:
		let t = node as! Segment
		str += " A: \(t.pointA.name) B: \(t.pointB.name) | length: \(t.value?.name ?? undefined) |"
	// MARK: - Figures
	case Polygon.dataTypeString, Triangle.dataTypeString:
		let t = node as! Polygon
		str += " from: [ "
		for v in t.vertexes {
			str += "\(v.name) "
		}
		str += "] |"
		
	// MARK: - Binary expression
	case BEBelong.dataTypeString, BEEquality.dataTypeString, BEParallelism.dataTypeString, BEPerpendicularity.dataTypeString:
		break
	case BEPolygonSimilarity.dataTypeString:
		let t = node as! BEPolygonSimilarity
		str += " left shift: \(t.leftShift.name) |"
		str += " ratio: \(t.ratio?.name ?? undefined) |"
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
public func description(solution: Solution, depth: Int = 0) -> String {
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

@available(iOS 10.0, *)
public func descriptionNodeRegistry() -> String {
	var str = "{NodeRegistry}\n"
	for type in nodeRegistry.dataTypes {
		str += "\(type.metatype.dataTypeString) [\(nodeRegistry.countInstances(for_type: type.metatype)) instances]:\n"
		for node in nodeRegistry.getInstances(for_type: type.metatype) {
			str += "\t\(description(node: node, with_references: true))"
		}
	}
	return str
}

@available(iOS 10.0, *)
public func descriptionTaskRegistry() -> String {
	var str = "{NodeRegistry}\n"
	for type in taskRegistry.dataTypes {
		str += "\(type.metatype.dataTypeString):"
		for task in taskRegistry.getInstances(for_type: type.metatype) {
			str += "\t\(description(task: task))"
		}
	}
	return str

}
