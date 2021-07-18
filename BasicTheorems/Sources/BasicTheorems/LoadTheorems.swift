//
//  AddTheorem.swift
//  
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import Foundation

import Core

@available(iOS 10.0, *)
public func loadTheorems() {

	// MARK: - Test
	#if DEBUG
	theoremRegistry.add(instances: TestTheorem())
	#endif

}
