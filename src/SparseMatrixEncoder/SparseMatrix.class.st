Class {
	#name : #SparseMatrix,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #SparseMatrixEncoder
}

{ #category : #initialization }
SparseMatrix >> addValue: aValue atRow: rowIndex column: columnIndex [

	elements at: rowIndex -> columnIndex put: aValue
]

{ #category : #initialization }
SparseMatrix >> asTraditionalMatrix [

	| maxRow maxCol matrix |
	maxRow := (elements keys collect: [ :key | key key ]) max.
	maxCol := (elements keys collect: [ :key | key value ]) max.
	matrix := TraditionalMatrix new: maxRow columns: maxCol.
	elements keys do: [ :key |
		matrix addValue: (elements at: key) atRow: key key column: key value ].
	^ matrix
]

{ #category : #accessing }
SparseMatrix >> elements [

	^ elements
]

{ #category : #initialization }
SparseMatrix >> initialize [

	super initialize.
	elements := Dictionary new
]

{ #category : #initialization }
SparseMatrix >> valueAtRow: rowIndex column: columnIndex [

	^ elements at: rowIndex -> columnIndex ifAbsent: [ 0 ]
]
