Class {
	#name : #DocumentationGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#category : #'DocGenerator-Tests'
}

{ #category : #tests }
DocumentationGeneratorTest >> testGenerateDocumentation [

	| documentation |
	documentation := generator generateDocumentation.

	self assert:
		(documentation includesSubstring: 'Class name: TraditionalMatrix').
	self assert:
		(documentation includesSubstring: 'Class name: SparseMatrixSubclass').
	self assert:
		(documentation includesSubstring: 'Class name: SparseMatrix').

	"verifying superclass information"
	self assert: (documentation includesSubstring: 'Superclass: Object').
	self assert:
		(documentation includesSubstring: 'Superclass: SparseMatrix').

	"Check for subclass information where applicable"
	self assert:
		(documentation includesSubstring: 'Subclasses: SparseMatrixSubclass').

	"Verifying instance variables and methods are correctly documented"
	self assert:
		(documentation includesSubstring: 'initialize:columns: senders:').
	self assert: (documentation includesSubstring:
			 'rows references: (initialize:columns:, numberOfRows, asSparseMatrix)')
]
