//
//  GeomerView.swift
//  Geomer
//
//  Created by Daniel Pustotin on 04.04.2021.
//

import SwiftUI

import Core
import BasicTheorems

struct GeomerView: View {

	init() {
		loadTheorems()
		solve()
	}

	var body: some View {

		ZStack {
			Color("BackgroundColor")
				.ignoresSafeArea()
			Image("Name_Transparent_1024")
				.resizable()
				.aspectRatio(contentMode: .fit)
		}
	}
}

struct GeomerView_Previews: PreviewProvider {
	static var previews: some View {
		GeomerView()
	}
}
