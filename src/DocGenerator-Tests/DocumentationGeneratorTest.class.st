Class {
	#name : #DocumentationGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#category : #'DocGenerator-Tests'
}

{ #category : #running }
DocumentationGeneratorTest >> setUp [

	| package |
	package := RPackageOrganizer default packageNamed:
		           'SparseMatrixEncoder'.
	package ifNil: [
		Transcript
			show: 'Package not found';
			cr ].
	generator := DocumentationGenerator new initializeWithPackage:
		             package.
	Transcript
		show: 'Generator initialized with package: ' , package name;
		cr
]

{ #category : #tests }
DocumentationGeneratorTest >> testGenerateDocumentation [
    | documentation |
    documentation := generator generateDocumentation.
]
