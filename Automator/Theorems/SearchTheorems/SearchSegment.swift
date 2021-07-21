//
    //  SearchSegment.swift
    //
    //
    //  Created by GeomerParser.
    //

    import Foundation

    import Core

    @available(iOS 10.0, *)
    internal class SearchSegment: Theorem {

    	// MARK: Initialization
    	internal init() {
    		super.init(name: "Search Segment",
    				   description: "",
    				   inputTypes: [Point.dataType(), Point.dataType()])
    	}

    	// MARK: Methods
    	internal override func execute() {
    		super.execute()
            // MARK: Parameters
    		let point1 = input[0] as! Point
			let point2 = input[1] as! Point

            // MARK: Preparation
    		

            // MARK: Theorem
    		if point1 == point2 {
			result = []
			return
		}
		
		if (true) {
			var res: Node
			res = Segment(a: point1, b: point2)
			result.append(res)
			res = Segment(a: point2, b: point1)
			result.append(res)
		}
    	}
    }