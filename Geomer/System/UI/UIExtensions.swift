//
//  UIExtensions.swift
//  Geomer
//
//  Created by Daniel Pustotin on 01.06.2021.
//

import SwiftUI

extension Animation {
	public static func springAnimation() -> Animation {
		Animation.spring(response: 0.3, dampingFraction: 0.7)
	}
}
