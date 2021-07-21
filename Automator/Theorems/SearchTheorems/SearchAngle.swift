//
    //  SearchAngle.swift
    //
    //
    //  Created by GeomerParser.
    //

    import Foundation

    import Core

    @available(iOS 10.0, *)
    internal class SearchAngle: Theorem {

    	// MARK: Initialization
    	internal init() {
    		super.init(name: "Search Angle",
    				   description: "",
    				   inputTypes: [Ray.dataType(), Ray.dataType()])
    	}

    	// MARK: Methods
    	internal override func execute() {
    		super.execute()
            // MARK: Parameters
    		let ray1 = input[0] as! Ray
			let ray2 = input[1] as! Ray

            // MARK: Preparation
    		

            // MARK: Theorem
    		if ray1 == ray2 {
			result = []
			return
		}
		
		if (ray1.a.equal(ray2.a)) {
			var res: Node
			res = Angle(ray1: ray1, ray2: ray2)
			result.append(res)
		}
    	}
    }