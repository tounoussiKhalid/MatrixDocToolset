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

	self assert: (documentation includesSubstring: 'Class name: Matrix').
	self assert:
		(documentation includesSubstring: 'Class name: TraditionalMatrix').
	self assert:
		(documentation includesSubstring: 'Class name: SparseMatrix').

	"Verify superclass information"
	self assert: (documentation includesSubstring: 'Superclass: Matrix').

	"Check for subclass information where applicable"
	self assert: (documentation includesSubstring:
			 'Subclasses: SparseMatrix, TraditionalMatrix').

	"Verify instance variables and methods are correctly documented"
	self assert: (documentation includesSubstring:
			 'asSparseMatrix senders: (	TraditionalMatrixTest >> testAsSparseMatrix, 	TraditionalMatrixTest >> testAsSparseMatrixWithMultipleValues, 	TraditionalMatrixTest >> testAsSparseMatrixAPrint)').
	self assert: (documentation includesSubstring:
			 'rows references: (initialize:columns:, numberOfRows, asSparseMatrix)')
]
