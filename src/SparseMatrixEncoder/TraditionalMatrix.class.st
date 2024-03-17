Class {
	#name : #TraditionalMatrix,
	#superclass : #Object,
	#instVars : [
		'rows',
		'columns',
		'elements'
	],
	#category : #SparseMatrixEncoder
}

{ #category : #'instance creation' }
TraditionalMatrix class >> new: aNumberOfRows columns: aNumberOfColumns [
    ^ self new initialize: aNumberOfRows columns: aNumberOfColumns
]

{ #category : #initialization }
TraditionalMatrix >> addValue: aValue atRow: rowIndex column: columnIndex [

	(elements at: rowIndex) at: columnIndex put: aValue
]

{ #category : #initialization }
TraditionalMatrix >> asSparseMatrix [

	| sparseMatrix |
	sparseMatrix := SparseMatrix new.
	1 to: rows do: [ :i |
		1 to: columns do: [ :j |
			| value |
			value := self valueAtRow: i column: j.
			value ~= 0 ifTrue: [
				sparseMatrix addValue: value atRow: i column: j ] ] ].
	^ sparseMatrix
]

{ #category : #initialization }
TraditionalMatrix >> initialize: aNumberOfRows columns: aNumberOfColumns [

	super initialize.
	rows := aNumberOfRows.
	columns := aNumberOfColumns.
	elements := Array new: rows.
	1 to: rows do: [ :i |
	elements at: i put: (Array new: columns withAll: 0) ]
]

{ #category : #accessing }
TraditionalMatrix >> numberOfColumns [

	^ columns
]

{ #category : #accessing }
TraditionalMatrix >> numberOfRows [

	^ rows
]

{ #category : #initialization }
TraditionalMatrix >> valueAtRow: rowIndex column: columnIndex [

	^ (elements at: rowIndex) at: columnIndex
]
