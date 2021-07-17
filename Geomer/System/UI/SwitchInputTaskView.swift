//
//  switchInputTaskView.swift
//  Geomer
//
//  Created by Daniel Pustotin on 01.06.2021.
//

import SwiftUI

enum NewDataKind: String {
	case input = "Input"
	case task = "Task"
}

struct SwitchButton {
	let viewIdx: NewDataKind
	var topLeading: Anchor<CGPoint>? = nil
	var bottomTrailing: Anchor<CGPoint>? = nil
}

struct SwitchButtonPreferenceKey: PreferenceKey {
	static var defaultValue: [SwitchButton] = []

	static func reduce(value: inout [SwitchButton], nextValue: () -> [SwitchButton]) {
		value.append(contentsOf: nextValue())
	}
}

struct SwitchButtonView: View {
	@Binding var currentNewDataType: NewDataKind

	let newDataKind: NewDataKind
	var label: String { newDataKind.rawValue }

	var body: some View {
		Button(action: {
			currentNewDataType = newDataKind
		}) {
			Text(label)
				.padding(10)
				.anchorPreference(key: SwitchButtonPreferenceKey.self, value: .topLeading, transform: { [SwitchButton(viewIdx: newDataKind, topLeading: $0)]
				})
				.transformAnchorPreference(key: SwitchButtonPreferenceKey.self, value: .bottomTrailing, transform: { ( value: inout [SwitchButton], anchor: Anchor<CGPoint>) in
					value[0].bottomTrailing = anchor
				})
		}
	}
}

struct SwitchNewDataTypeView: View {

	@Binding var showingAddNewData: Bool
	@Binding var newDataAddingStep: NewDataAddingStep

	@Binding var newDataKind: NewDataKind

	var body: some View {

				HStack {

					Spacer()

					SwitchButtonView(currentNewDataType: $newDataKind, newDataKind: .input)
						.disabled(showingAddNewData)

					Spacer()

					SwitchButtonView(currentNewDataType: $newDataKind, newDataKind: .task)
						.disabled(showingAddNewData)

					Spacer()

				}
				.backgroundPreferenceValue(SwitchButtonPreferenceKey.self) { preferences in
					GeometryReader { geometry in
						createUnderline(geometry, preferences)
							.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
					}
				}
				.padding()
	}

	func createUnderline(_ geometry: GeometryProxy, _ preferences: [SwitchButton]) -> some View {
		let p = preferences.first(where: { $0.viewIdx == newDataKind })

		let aTopLeading = p?.topLeading
		let aBottomTrailing = p?.bottomTrailing

		let topLeading = aTopLeading != nil ? geometry[aTopLeading!] : .zero
		let bottomTrailing = aBottomTrailing != nil ? geometry[aBottomTrailing!] : .zero

		return RoundedRectangle(cornerRadius: cornersRadiusSmall)
			.stroke(lineWidth: strokeWidth)
			.foregroundColor(vitalColor)
			.frame(width: bottomTrailing.x - topLeading.x, height: strokeWidth)
			.fixedSize()
			.offset(x: topLeading.x, y: bottomTrailing.y)
			.animation(.springAnimation())
	}
}

struct switchInputTaskView_Previews: PreviewProvider {
	static var previews: some View {
		SwitchNewDataTypeView(showingAddNewData: .constant(false), newDataAddingStep: .constant(.none), newDataKind: .constant(.input))
	}
}
