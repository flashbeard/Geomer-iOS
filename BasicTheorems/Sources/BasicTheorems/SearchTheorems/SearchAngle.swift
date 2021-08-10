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

    	// MARK: - Initialization
    	internal init() {
    		super.init(name: "Search Angle",
    				   description: "",
    				   inputTypes: [Ray.dataType, Ray.dataType])
    	}

    	// MARK: - Methods
    	internal override func execute() {

			let time = DispatchTime.now()

            // MARK: Parameters
    		let ray1 = input[0] as! Ray
			let ray2 = input[1] as! Ray

            // MARK: Preparation
    		if ray1.equal(ray2) {
				return
			}

            // MARK: Theorem
    		if (ray1.from.equal(ray2.from)) {
				result.append(Angle(ray1: ray1, ray2: ray2))
			}

			timesAngles.append(Double(DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds) / 1e9)

    	}
    }
