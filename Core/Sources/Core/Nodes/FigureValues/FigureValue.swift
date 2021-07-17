//
//  FigureValue.swift
//  
//
//  Created by Daniel Pustotin on 07.07.2021.
//

import Foundation

@available(iOS 10.0, *)
protocol FigureValue: Node {
	// MARK: Properties
	var figure: Figure { get set }
}
