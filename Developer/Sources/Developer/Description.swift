//
//  Description.swift
//  
//
//  Created by Daniel Pustotin on 20.05.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
public func description(data op: Core.Data?) -> String {
	if op == nil {
		return ""
	}
	let data = op!
	let undefined = "Undefined"
	var str = "| type: \(data.dataType) | input: \(data.isInput ? "(+) yes" : "(-) no") | name: \(data.name) |"
	
	switch data.dataTypeString {
	// MARK: Non geometry objects
	case Task.dataTypeString:
		let t = data as! Task
		str += " achieved: \(t.achieved ? "(+) yes" : "(-) no") | \n\t\ttask: { \(description(data: t.task)) } |"
	case Theorem.dataTypeString:
		let t = data as! Theorem
		str += " input types: [ "
		for i in 0 ..< t.inputTypes.count - 1 {
			str += "\(t.inputTypes[i]); "
		}
		str += "\(t.inputTypes.last!) ] |"
	case Reference.dataTypeString:
		let t = data as! Reference
		str = " from: [ "
		for i in 0 ..< t.fromNodes.count - 1 {
			str += "\(t.fromNodes[i].info()); "
		}
		str += "\(t.fromNodes.last!.info()) ]\tby theorem: \(t.byTheorem.info())"
		return str

	// MARK: Nodes
	// MARK: Figure values
	case Area.dataTypeString:
		let t = data as! Area
		str += " figure: \(t.figure.name) | value: \(t.value?.info() ?? undefined) |"
	// MARK: Geometry objects
	case Point.dataTypeString:
		break
	case Angle.dataTypeString:
		let t = data as! Angle
		str += " vertex: \(t.vertex.info()) | value: \(t.value?.info() ?? undefined) | rays: [ \(t.r1.info()); \(t.r2.info()) ] |"
	case Line.dataTypeString:
		let t = data as! Line
		str += " A: \(t.a.info()) B: \(t.b.info()) |"
	case Ray.dataTypeString:
		let t = data as! Ray
		str += " from: \(t.a.info()) through: \(t.b.info()) |"
	case Segment.dataTypeString:
		let t = data as! Segment
		str += " A: \(t.a.info()) B: \(t.b.info()) | length: \(t.length?.info() ?? undefined) |"
		
	// MARK: Figures
	case Polygon.dataTypeString, Triangle.dataTypeString:
		let t = data as! Polygon
		str += " from: [ "
		for i in 0 ..< t.vertexes.count - 1 {
			str += "\(t.vertexes[i].info()); "
		}
		str += "\(t.vertexes.last!.info()) ] |"
		
	// MARK: Binary expression
	case BEBelong.dataTypeString, BEEquality.dataTypeString, BEParallelism.dataTypeString, BEPerpendicularity.dataTypeString:
		break
	// TODO: Add shifting to similarity and equality
	case BEPolygonSimilarity.dataTypeString:
		let t = data as! BEPolygonSimilarity
		str += " left shift: \(shiftDescription(shift: t.leftShift)) |"
		str += " proportion: \(t.proportion?.info() ?? undefined) |"
	case BEPolygonEquality.dataTypeString:
		let t = data as! BEPolygonEquality
		str += " left shift: \(shiftDescription(shift: t.leftShift)) |"
	default:
		break
	}

	return str
}

public func shiftDescription(shift: Shift) -> String {
	"[\(shift.reversed ? "reversed" : "") \(shift.value)]"
}

@available(iOS 10.0, *)
public func referencesDescription(node: Node) -> String {
	var str = ""
	var i = 1
	for reference in node.references {
		str += "\t\t[\(i)]: \(description(data: reference))\n"
		i += 1
	}
	return str
}

@available(iOS 10.0, *)
public func descriptionNodeRegistry() {
	for type in nodeRegistry.dataTypes {
		print("\(type.metatype.dataTypeString) [\(nodeRegistry.countInstances(for_type: type.metatype)) instances]:")
		for instance in nodeRegistry.getInstances(for_type: type.metatype) {
			print("\t\(description(data: instance))")
			print(referencesDescription(node: instance))
		}
	}
}

@available(iOS 10.0, *)
public func descriptionTaskRegistry() {
	for type in taskRegistry.dataTypes {
		print("\(type.metatype.dataTypeString):")
		for instance in taskRegistry.getInstances(for_type: type.metatype) {
			print("\t\(description(data: instance))")
		}
	}
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
		str += node.info()
		str += "\n"

		if reference != nil {
			depth += 1
		}
	}

	str = String(str.suffix(str.count - 3))

	return str
}
