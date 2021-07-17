//
//  AddView.swift
//  Geomer
//
//  Created by Daniel Pustotin on 01.06.2021.
//

import SwiftUI

import Core
import Solver

enum NewDataAddingStep: Int {
	case none = 0
	case type = 1
	case properties = 2
}

struct NewDataTypeRaw: View, Hashable {
	static func == (lhs: NewDataTypeRaw, rhs: NewDataTypeRaw) -> Bool {
		lhs.type == rhs.type
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(type.dataTypeString)
	}

	@Binding var addingStep: NewDataAddingStep
	@Binding var addingType: DataType
	let type: DataType

	var body: some View {
		Button(action: {
			addingStep = .properties
			addingType = type
		}) {
			Text(type.dataTypeString)
				.font(.title)
		}
	}
}

struct AddNewDataView: View {

	@Binding var newDataKind: NewDataKind
	@Binding var showingAddNewData: Bool
	@Binding var newDataAddingStep: NewDataAddingStep

	@State var newDataType: DataType = Data.dataType

	@State var dragOffset: CGSize = .zero

	var body: some View {

		ZStack {
			NewDataTypeView(newDataAddingStep: $newDataAddingStep, newDataType: $newDataType)
			NewDataPropertiesView(showingAddNewData: $showingAddNewData, newDataKind: $newDataKind, newDataAddingStep: $newDataAddingStep, newDataType: $newDataType)
		}
		.padding(.top, viewPadding)
		.offset(x: dragOffset.width)
		.gesture(DragGesture()
					.onChanged { value in
						if newDataAddingStep == .properties && value.translation.width > 0 {
							dragOffset = value.translation
						}
					}
					.onEnded { value in
						if newDataAddingStep == .properties && dragOffset.width > dragCancelOffset {
							newDataAddingStep = .type
						}
						dragOffset = .zero
					})
	}
}

struct NewDataTypeView: View {

	@Binding var newDataAddingStep: NewDataAddingStep
	@Binding var newDataType: DataType

	var body: some View {

		let basicsSection = [
			NewDataTypeRaw(addingStep: $newDataAddingStep, addingType: $newDataType, type: Point.self),
			NewDataTypeRaw(addingStep: $newDataAddingStep, addingType: $newDataType, type: Line.self),
			NewDataTypeRaw(addingStep: $newDataAddingStep, addingType: $newDataType, type: Segment.self),
			NewDataTypeRaw(addingStep: $newDataAddingStep, addingType: $newDataType, type: Ray.self),
			NewDataTypeRaw(addingStep: $newDataAddingStep, addingType: $newDataType, type: Angle.self)
		]

		let figuresSection = [
			NewDataTypeRaw(addingStep: $newDataAddingStep, addingType: $newDataType, type: Polygon.self),
			NewDataTypeRaw(addingStep: $newDataAddingStep, addingType: $newDataType, type: Triangle.self)
		]

		UITableView.appearance().backgroundColor = .clear
		UITableViewCell.appearance().backgroundColor = .clear

		return VStack(alignment: .leading) {
			Text("Type")
				.font(.largeTitle)
				.padding()
				.foregroundColor(Color.accentColor)

			List {
				Section(header: Text("Basics").padding()) {
					ForEach(basicsSection, id: \.self) { raw in
						raw
					}
					.listRowBackground(backgroundColor)
				}
				Section(header: Text("Figures").padding()) {
					ForEach(figuresSection, id: \.self) { raw in
						raw
					}
					.listRowBackground(backgroundColor)
				}
			}
			.listStyle(InsetGroupedListStyle())
		}
		.background(backgroundColor)
		.frame(maxWidth: screen.width)
		.frame(height: heightAddNewData)
		.background(backgroundColor)
		.clipShape(RoundedRectangle(cornerRadius: cornersRadiusLarge, style: .continuous))
		.shadow(radius: shadowsRadius)
		.padding(.horizontal, viewPadding)
		.offset(x: newDataAddingStep == .type ? 0 : newDataAddingStep == .none ? screen.width : -screen.width)
	}
}

struct NewDataPropertiesView: View {

	@Binding var showingAddNewData: Bool
	@Binding var newDataKind: NewDataKind
	@Binding var newDataAddingStep: NewDataAddingStep
	@Binding var newDataType: DataType

	@State private var showingAlert: Bool = false

	private var preparator: Preparator

	init(showingAddNewData: Binding<Bool>, newDataKind: Binding<NewDataKind>, newDataAddingStep: Binding<NewDataAddingStep>, newDataType: Binding<DataType>) {
		_showingAddNewData = showingAddNewData
		_newDataKind = newDataKind
		_newDataAddingStep = newDataAddingStep
		_newDataType = newDataType
		preparator = PreparatorRegistry.getPreparator(type: newDataType.wrappedValue)
	}

	var body: some View {

		return ZStack {
			VStack {
				ScrollView {
					VStack {
						ForEach(0 ..< preparator.propertyCount, id: \.self) { i in
							HStack {
								Text("\(preparator.propertyNames[i]):")
									.padding()

								TextField(preparator.propertyNames[i], text: preparator.binding(for: preparator.propertyNames[i]))
									.multilineTextAlignment(.center)
									.padding()
									.background(highlightedColor)
									.frame(maxWidth: textfieldWidth)
									.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
							}
						}
					}
				}
				Spacer()

				HStack {
					Spacer()

					Button(action: {
						let newNode: Node? = preparator.prepare()
						if newNode == nil {
							showingAlert = true
						} else {
							switch newDataKind {
							case .input:
								solver.addNewInput(node: preparator.prepare()!)
							case .task:
								solver.addNewTask(node: preparator.prepare()!)
							}
							newDataType = Core.Data.self
							newDataAddingStep = .none
							showingAddNewData = false
						}
					}) {
						Text("Add")
							.font(.largeTitle)
							.foregroundColor(Color.accentColor)
							.frame(width: buttonSize, height: buttonSize)
							.background(vitalColor)
							.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
					}
				}
				.alert(isPresented: $showingAlert) {
					Alert(title: Text("Cannot create node with these properties"), message: Text("Please, provide valid properties"), dismissButton: .cancel())
				}
			}
		}
		.padding(viewPadding)
		.background(backgroundColor)
		.frame(maxWidth: screen.width)
		.frame(height: heightAddNewData)
		.background(backgroundColor)
		.clipShape(RoundedRectangle(cornerRadius: cornersRadiusLarge, style: .continuous))
		.shadow(radius: shadowsRadius)
		.padding(.horizontal, viewPadding)
		.offset(x: newDataAddingStep == .properties ? 0 : screen.width)
	}
}
