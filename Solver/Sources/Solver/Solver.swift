//
//  Solver.swift
//  
//
//  Created by Daniel Pustotin on 20.05.2021.
//

import Foundation

import Core
import Developer
import BasicTheorems

@available(iOS 10.0, *)
public let solver = Solver.shared

@available(iOS 10.0, *)
public class Solver {
	
	// MARK: - Singleton pattern
	public static let shared = Solver()

	public func addInput(node: Node) {
		nodeRegistry.add(instances: node)
	}
	
	public func addTask(node: Node) {
		let task = Task(task: node)
		taskRegistry.add(instances: task)
	}
	
	public func solve() {
		
		// MARK: - Preparing
		loadTheorems()
		loadInputData()
		
		// MARK: - Input info
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tInput data:")
		print(descriptionNodeRegistry())
		#endif
		
		// MARK: - Main loop
		
		//	taskRegistry.checkAchieved(instances: nodeRegistry)

		while nodeRegistry.hasChanges {
			
			nodeRegistry.fixState()


			for theorem in theoremRegistry.getAllInstances() {
				let testPrint = theorem.dataTypeString == "TheoremEqualityTriangleSideSideSide"
				if testPrint { print(theorem.name) }
				var time = DispatchTime.now()
				let inputs = nodeRegistry.getKit(for_pattern: theorem.inputTypes)
				if testPrint { print("get kit elapsed time:", Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e6, "(ms)") }
				time = DispatchTime.now()
				if testPrint { print("number of inputs: \(inputs.count)") }
				var settingTime = 0.0
				var applyTime = 0.0
				for input in inputs {
					settingTime -= Double(DispatchTime.now().uptimeNanoseconds)
					theorem.setInput(input: input)
					settingTime += Double(DispatchTime.now().uptimeNanoseconds)
					applyTime -= Double(DispatchTime.now().uptimeNanoseconds)
					theorem.apply()
					applyTime += Double(DispatchTime.now().uptimeNanoseconds)
				}
				if testPrint { print("setting input time:", settingTime / 1e6, "(ms)") }
				if testPrint { print("apply time:", applyTime / 1e6, "(ms)") }
				if testPrint { print("execution time:", Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e6, "(ms)") }
				if testPrint { print() }
			}

			print(descriptionNodeRegistry())

			taskRegistry.checkAchieved(instances: nodeRegistry.newInstances)
			
			// MARK: this code stops computing solution if all the tasks are achieved, even if there are another solutions for them (possible easier)
			//		if taskRegistry.allAchieved { break }
		}
		
		// MARK: - Result info
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tResult data:")
		print(descriptionNodeRegistry())
		#endif
		
		// MARK: - Tasks check and info
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tTasks:")
		print("\t\t\tAchieved \(taskRegistry.achievedCount) of \(taskRegistry.count)")
		if taskRegistry.allAchieved {
			print("\t\t\tAll tasts are achieved")
		}
		print(descriptionTaskRegistry())
		#endif
		
		// MARK: - Tasks solution
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tTasks solution:\n")
		for task in taskRegistry.getInstances(for_type: Task.self) {
			print("\n--------------------------------\n")
			var node = task.task
			nodeRegistry.find(instance: &node)
			let solution = Solution(for: node)
			solution.backtrack()
			print(description(solution: solution))
		}
		#endif
		
		// MARK: - Testing data
		#if DEBUG
		print("End")
		#endif
	}
}
