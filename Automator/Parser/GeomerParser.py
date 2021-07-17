import json
import os

theoremsModule = 'BasicTheorems'

path = '../Theorems/{0}'.format(theoremsModule)
json_file = open("{0}.json".format(theoremsModule))
theoremsList = []
data = json.loads(json_file.read())
theoremsCount = len(data['theorems'])

# Theorems
for fileNumber in range(theoremsCount):
    theoremsList.append(data['theorems'][fileNumber])

#os.system('clear')
print('Geomer Parser')
print('Theorem Module: {0}'.format(theoremsModule))
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
        parameters += "let {0} = input[{1}] as! {2}".format(theorem['parameters'][i], i, theorem['input types'][i]) + "\n" + "\t\t"
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

    # Conditions
    conditionsCount = len(swift['algorithm'])
    conditions = ""
    for i in range(conditionsCount):
        algorithm = swift['algorithm'][i]

        condition = str(algorithm['condition'])

        resultLenght = len(algorithm['result'])
        result = ""
        for i in range(resultLenght - 1):
            result += str(algorithm['result'][i]) + "\n" + "\t\t\t"
        if resultLenght:
            result += str(algorithm['result'][resultLenght - 1])

        conditions += """if ({condition}) {
            // MARK: Creating result
		    var res: Node

            // MARK: Defining result
		    {result}

            // MARK: Saving result
		    result.append(res)
	    }
        """
        conditions = conditions.replace('{condition}', condition)
        conditions = conditions.replace('{result}', result)

    conditions = conditions[0:-9]

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
		{conditions}
	}
}"""

    # Code formatting
    fileCode = fileCode.replace('{theoremClass}', theoremClass)
    fileCode = fileCode.replace('{theoremName}', theoremName)
    fileCode = fileCode.replace('{theoremDescription}', theoremDescription)
    fileCode = fileCode.replace('{inputTypes}', inputTypes)
    fileCode = fileCode.replace('{parameters}', parameters)
    fileCode = fileCode.replace('{preparation}', preparation)
    fileCode = fileCode.replace('{conditions}', conditions)

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
