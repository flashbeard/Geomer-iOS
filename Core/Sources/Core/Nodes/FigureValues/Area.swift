//
//  Area.swift
//  
//
//  Created by Daniel Pustotin on 07.07.2021.
//

import Foundation

@available(iOS 10.0, *)
public class Area: Node, FigureValue {

	// MARK: - Properties
	public internal(set) var figure: Figure
	public internal(set) var value: SquareUnit?

	// MARK: - Initialization
	public init(figure: Figure, value: SquareUnit? = nil) {
		var paramFigure: Node = figure
		nodeRegistry.find(instance: &paramFigure, put: true)
		self.figure = figure
		self.value = value
		super.init(name: "Area(\(figure.name))")
	}
}
