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
	
	// MARK: Singleton pattern
	public static let shared = Solver()
	
	// MARK: Protection from multiple calling solve() method
	private var solveCount: Int = 0
	
	public func addNewInput(node: Node) {
		nodeRegistry.add(instances: node)
	}
	
	public func addNewTask(node: Node) {
		let task = Task(task: node)
		taskRegistry.add(instances: task)
	}
	
	public func solve() {
		
		solveCount += 1
		if solveCount != 1 {
			return
		}
		
		// MARK: Preparing
		loadTheorems()
		loadInputData()
		
		// MARK: Input info
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tInput data:")
		descriptionNodeRegistry()
		#endif
		
		// MARK: Main loop
		
		//	taskRegistry.checkAchieved(instances: nodeRegistry)
		
		while nodeRegistry.hasChanges {
			
			nodeRegistry.fixState()
			
			for theorem in theoremRegistry.getAllInstances() {
				let inputs = nodeRegistry.getKit(for_pattern: theorem.inputTypes)
				for input in inputs {
					theorem.input = input
					theorem.apply()
				}
			}

			// MARK: Result info
			#if DEBUG
			print("================================================================\n")
			print("\t\t\tResult data:")
			descriptionNodeRegistry()
			#endif
			
			taskRegistry.checkAchieved(instances: nodeRegistry.newInstances)
			
			// MARK: this code stops computing solution if all the tasks are achieved, even if there are another solutions for them (possible easier)
			//		if taskRegistry.allAchieved { break }
		}
		
		// MARK: Result info
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tResult data:")
		descriptionNodeRegistry()
		#endif
		
		// MARK: Tasks check and info
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tTasks:")
		print("\t\t\tAchieved \(taskRegistry.achievedCount) of \(taskRegistry.count)")
		if taskRegistry.allAchieved {
			print("\t\t\tAll tasts are achieved")
		}
		descriptionTaskRegistry()
		#endif
		
		// MARK: Tasks solution
		#if DEBUG
		print("================================================================\n")
		print("\t\t\tTasks solution:\n")
		for task in taskRegistry.getInstances(for_type: Task.self) {
			print("\n--------------------------------\n")
			var node = task.task
			nodeRegistry.find(instance: &node)
			let solution = Solution(for: node)
			solution.backtrackSolution()
			print(descriptionSolution(solution: solution))
		}
		#endif

		for node in nodeRegistry.getAllInstances() {
			let solution = Solution(for: node)
			solution.backtrackSolution()
			print(descriptionSolution(solution: solution))
		}
		
		// MARK: Testing data
		#if DEBUG
		print("End")
		#endif
	}
}
