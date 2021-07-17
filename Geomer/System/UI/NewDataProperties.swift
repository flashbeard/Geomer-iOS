//
//  NewDataProperties.swift
//  Geomer
//
//  Created by Daniel Pustotin on 30.06.2021.
//

import SwiftUI

import Core

struct AddPointPropertiesView: View {
	@Binding var addingType: DataType
	@Binding var addingProperties: [String]

	@State var newProperty: String = String()

	var body: some View {

		VStack {
			HStack() {
				Text("Name")
					.font(.headline)
					.foregroundColor(Color.accentColor)
					.padding()

				Spacer()

				TextField("name", text: $newProperty, onEditingChanged: { _ in
					if addingProperties.count <= 0 {
						addingProperties.append(String())
					}
					addingProperties[0] = newProperty
				})
				.font(.headline)
				.foregroundColor(Color.accentColor)
				.multilineTextAlignment(.center)
				.padding()
				.frame(maxWidth: 100)
				.background(highlightedColor)
				.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall, style: .continuous))
			}
		}
		.padding(.horizontal, viewPadding)
	}
}
