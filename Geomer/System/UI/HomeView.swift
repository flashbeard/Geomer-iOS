//
//  HomeView.swift
//  Geomer
//
//  Created by Daniel Pustotin on 31.05.2021.
//

import SwiftUI
import Solver

struct HomeView: View {

	@State var showingNewProblem: Bool = false
	@State var showingHistory: Bool = false

	var body: some View {
		ZStack {
			backgroundColor
				.ignoresSafeArea()

			VStack {
				Spacer()

				Image("Logo_Transparent")
					.renderingMode(.original)
					.resizable()
					.aspectRatio(contentMode: .fit)

				Spacer()

				HStack {
					ShowHistoryButton(showingHistory: $showingHistory)

					Spacer()

					ShowNewProblemButton(showingNewProblem: $showingNewProblem)
				}
				.padding(viewPadding)
			}

			HistoryView(showingHistory: $showingHistory)

			NewProblemView(showingNewProblem: $showingNewProblem)
		}
		.ignoresSafeArea()
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}

// MARK: - Button to show NewProblemView
struct ShowNewProblemButton: View {

	@Binding var showingNewProblem: Bool

	var body: some View {
		Button(action: {
			showingNewProblem.toggle()
		}) {
			Image(systemName: "plus")
				.font(.largeTitle)
				.foregroundColor(Color.accentColor)
				.frame(width: buttonSize, height: buttonSize)
				.background(vitalColor)
				.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
		}
	}
}

// MARK: - Button to show NewProblemView
struct ShowHistoryButton: View {

	@Binding var showingHistory: Bool

	var body: some View {
		Button(action: {
			showingHistory.toggle()
		}) {
			Image(systemName: "clock.arrow.circlepath")
				.font(.largeTitle)
				.foregroundColor(Color.accentColor)
				.frame(width: buttonSize, height: buttonSize)
				.background(vitalColor)
				.clipShape(RoundedRectangle(cornerRadius: cornersRadiusSmall))
		}
	}
}
