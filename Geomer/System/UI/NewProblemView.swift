//
//  NewProblemView.swift
//  Geomer
//
//  Created by Daniel Pustotin on 24.05.2021.
//

import SwiftUI

import Core
import Developer

struct NewProblemView: View {

	@Binding var showingNewProblem: Bool

	@State var newDataKind: NewDataKind = .input
	@State var showingAddNewData: Bool = false
	@State var dragOffset: CGSize = .zero
	@State var newDataAddingStep: NewDataAddingStep = .none

	var shouldRoundCorners: Bool {
		showingAddNewData || dragOffset != .zero
	}

	var body: some View {
		ZStack {
			(showingAddNewData ? Color.accentColor : Color.clear)
				.ignoresSafeArea()

			ZStack {

				VStack {

					ZStack {

					ScrollView {
						VStack(alignment: .leading) {
							ForEach(nodeRegistry.getAllInstances().sorted(by: <), id: \.self) { node in
								Text(description(data: node))
									.padding()
									.background(highlightedColor)
									.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
							}
						}
					}
					.padding(viewPadding)
					.offset(x: newDataKind == .input ? 0 : -screen.width)

						ScrollView {
							VStack(alignment: .leading) {
								ForEach(taskRegistry.getAllInstances().sorted(by: <), id: \.self) { node in
									Text(description(data: node))
										.padding()
										.background(highlightedColor)
										.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
								}
							}
						}
						.padding(viewPadding)
						.offset(x: newDataKind == .task ? 0 : screen.width)

					}
					Spacer()

					HStack {

						SwitchNewDataTypeView(showingAddNewData: $showingAddNewData, newDataAddingStep: $newDataAddingStep, newDataKind: $newDataKind)

						showAddButton(showingAddNewData: $showingAddNewData, newDataAddingStep: $newDataAddingStep)
					}
					.padding(viewPadding)
				}

				VStack {
					AddNewDataView(newDataKind: $newDataKind, showingAddNewData: $showingAddNewData, newDataAddingStep: $newDataAddingStep)
					Spacer()
				}
			}
			.background(backgroundColor)
			.clipShape(RoundedRectangle(cornerRadius: shouldRoundCorners ? cornersRadiusLarge : 0))
			.scaleEffect(showingAddNewData ? 0.9 : 1)
			.animation(.springAnimation())
		}
		.ignoresSafeArea()
		.shadow(color: shadowsColor, radius: shadowsRadius, x: 0, y: shadowsRadius)
		.offset(x: showingNewProblem ? 0 : screen.width)
		.offset(x: max(dragOffset.width * 0.5, 0))
		.gesture(DragGesture()
					.onChanged {value in
						if !showingAddNewData {
							dragOffset = value.translation
						}
					}
					.onEnded { value in
						if !showingAddNewData && dragOffset.width > dragCancelOffset {
							newDataAddingStep = .none
							showingAddNewData = false
							showingNewProblem = false
						}
						dragOffset = .zero
					})
		.animation(.springAnimation())
	}
}

struct NewProblemView_Previews: PreviewProvider {
	@Binding var showingInputDataView: Bool
	static var previews: some View {
		NewProblemView(showingNewProblem: .constant(true))
	}
}


// MARK: - Button to show AddNewDataView
struct showAddButton: View {

	@Binding var showingAddNewData: Bool
	@Binding var newDataAddingStep: NewDataAddingStep

	var body: some View {
		Button(action: {
			newDataAddingStep = .none
			showingAddNewData.toggle()
			newDataAddingStep = showingAddNewData ? .type : .none
		}) {
			Image(systemName: "plus")
				.font(.largeTitle)
				.foregroundColor(Color.accentColor)
				.rotationEffect(showingAddNewData ? Angle(degrees: -45) : Angle(degrees: 0))
				.padding()
				.background(vitalColor)
				.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
				.animation(.springAnimation())
		}

	}
}
