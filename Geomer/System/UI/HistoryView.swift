//
//  HistoryView.swift
//  Geomer
//
//  Created by Daniel Pustotin on 01.06.2021.
//

import SwiftUI

import Core
import Solver

struct HistoryView: View {
	@Binding var showingHistory: Bool

	@State var dragOffset: CGSize = .zero

	var body: some View {
		ZStack {
			backgroundColor

			VStack {
				Text("History")
					.font(.largeTitle)
					.foregroundColor(Color.accentColor)
					.underline()
					.padding()
					.frame(maxHeight: buttonSize)

				Spacer()

				Button(action: {
					solver.solve()
				}, label: {
					Text("Solve sample")
				})
				.font(.largeTitle)
				.foregroundColor(Color.accentColor)
				.padding()
				.frame(maxHeight: buttonSize)
				.background(vitalColor)
				.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
			}
			.padding(viewPadding)
		}
		.ignoresSafeArea()
		.shadow(color: shadowsColor, radius: shadowsRadius, x: 0, y: shadowsRadius)
		.offset(x: showingHistory ? 0 : -screen.width)
		.offset(x: min(dragOffset.width * 0.5, 0))
		.gesture(DragGesture()
					.onChanged {value in
						dragOffset = value.translation
					}
					.onEnded { value in
						if dragOffset.width < -dragCancelOffset {
							showingHistory = false
						}
						dragOffset = .zero
					})
		.animation(.springAnimation())
	}

}

struct HistoryView_Previews: PreviewProvider {
	static var previews: some View {
		HistoryView(showingHistory: .constant(true))
	}
}
