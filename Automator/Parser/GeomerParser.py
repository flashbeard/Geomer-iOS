import json
import os

theoremsModule = ['EqualityTheorems', 'SimilarityTheorems', 'SearchTheorems']

for index in range(len(theoremsModule)):
    path = '../Theorems/{0}'.format(theoremsModule[index])
    json_file = open("{0}.json".format(theoremsModule[index]))
    theoremsList = []
    data = json.loads(json_file.read())
    theoremsCount = len(data['theorems'])

    # Theorems
    for fileNumber in range(theoremsCount):
        theoremsList.append(data['theorems'][fileNumber])

    #os.system('clear')
    print('Geomer Parser')
    print('Theorem Module: {0}'.format(theoremsModule[index]))
    print('Directory:\n\t{0}'.format(path))
    print('Files added:')

    # Main loop - creating a new file
    for fileNumber in range(theoremsCount):

        theorem = theoremsList[fileNumber]

        # Class
        theoremClass = str(theorem['class'])

        # Name
        theoremName = str(theorem['name'])

        # Description
        theoremDescription = str(theorem['description'])

        # DataTypes
        inputTypesCount = len(theorem['input types'])
        inputTypes = ""
        for i in range(inputTypesCount):
            inputTypes += str(theorem['input types'][i]) + ".dataType(), "
        inputTypes = inputTypes[:-2]

        # Variables
        parametersCount = len(theorem['parameters'])
        parameters = ""
        for i in range(parametersCount - 1):
            parameters += "let {0} = input[{1}] as! {2}".format(theorem['parameters'][i], i, theorem['input types'][i]) + "\n" + "\t\t\t"
        if parametersCount:
            parameters += "let {0} = input[{1}] as! {2}".format(theorem['parameters'][parametersCount - 1], parametersCount - 1, theorem['input types'][i])

        # Swift
        swift = theorem['swift']

        # Preparation
        preparationLength = len(swift['preparation'])
        preparation = ""
        for i in range(preparationLength - 1):
            preparation += str(swift['preparation'][i]) + "\n" + "\t\t"
        if preparationLength:
           preparation += str(swift['preparation'][preparationLength - 1])

        # Algorithm
        algorithmCount = len(swift['algorithm'])
        algorithm = ""
        for i in range(algorithmCount):
            algorithm += swift['algorithm'][i] + "\n\t\t"

        algorithm = algorithm[0:-3]

        fileCode = """//
    //  {theoremClass}.swift
    //
    //
    //  Created by GeomerParser.
    //

    import Foundation

    import Core

    @available(iOS 10.0, *)
    internal class {theoremClass}: Theorem {

    	// MARK: Initialization
    	internal init() {
    		super.init(name: "{theoremName}",
    				   description: "{theoremDescription}",
    				   inputTypes: [{inputTypes}])
    	}

    	// MARK: Methods
    	internal override func execute() {
    		super.execute()
            // MARK: Parameters
    		{parameters}

            // MARK: Preparation
    		{preparation}

            // MARK: Theorem
    		{algorithm}
    	}
    }"""

        # Code formatting
        fileCode = fileCode.replace('{theoremClass}', theoremClass)
        fileCode = fileCode.replace('{theoremName}', theoremName)
        fileCode = fileCode.replace('{theoremDescription}', theoremDescription)
        fileCode = fileCode.replace('{inputTypes}', inputTypes)
        fileCode = fileCode.replace('{parameters}', parameters)
        fileCode = fileCode.replace('{preparation}', preparation)
        fileCode = fileCode.replace('{algorithm}', algorithm)

        # File saving
        if not os.path.exists(path):
            os.makedirs(path)

        fileName = "{0}/{1}.swift".format(path, theoremClass)
        print("\t{0}.swift".format(theoremClass))

        if not os.path.exists(fileName):
            open(fileName, "a")
        file = open(fileName, "w+")
        file.write(fileCode)
        file.close()
