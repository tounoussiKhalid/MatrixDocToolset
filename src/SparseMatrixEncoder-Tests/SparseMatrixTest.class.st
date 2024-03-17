Class {
	#name : #SparseMatrixTest,
	#superclass : #TestCase,
	#category : #'SparseMatrixEncoder-Tests'
}

{ #category : #tests }
SparseMatrixTest >> testAddMultipleValues [

	| sparseMatrix |
	sparseMatrix := SparseMatrix new.

	"Adding values according to the matrix provided"
	sparseMatrix addValue: 3 atRow: 1 column: 3.
	sparseMatrix addValue: 4 atRow: 1 column: 5.
	sparseMatrix addValue: 5 atRow: 2 column: 3.
	sparseMatrix addValue: 7 atRow: 2 column: 4.
	sparseMatrix addValue: 2 atRow: 4 column: 3.
	sparseMatrix addValue: 6 atRow: 4 column: 4.

	"Asserting that the values are correct"
	self assert: (sparseMatrix valueAtRow: 1 column: 3) equals: 3.
	self assert: (sparseMatrix valueAtRow: 1 column: 5) equals: 4.
	self assert: (sparseMatrix valueAtRow: 2 column: 3) equals: 5.
	self assert: (sparseMatrix valueAtRow: 2 column: 4) equals: 7.
	self assert: (sparseMatrix valueAtRow: 4 column: 3) equals: 2.
	self assert: (sparseMatrix valueAtRow: 4 column: 4) equals: 6.

	"Asserting that a value that was not added is zero "
	self assert: (sparseMatrix valueAtRow: 3 column: 1) equals: 0
]

{ #category : #tests }
SparseMatrixTest >> testAddValue [

	| sparseMatrix |
	sparseMatrix := SparseMatrix new.
	sparseMatrix addValue: 1 atRow: 1 column: 1.
	self assert: (sparseMatrix valueAtRow: 1 column: 1) equals: 1
]

{ #category : #tests }
SparseMatrixTest >> testAsTraditionalMatrix [

	| sparseMatrix traditionalMatrix |
	sparseMatrix := SparseMatrix new.
	sparseMatrix addValue: 1 atRow: 1 column: 1.
	traditionalMatrix := sparseMatrix asTraditionalMatrix.
	self assert: (traditionalMatrix valueAtRow: 1 column: 1) equals: 1
]

{ #category : #tests }
SparseMatrixTest >> testAsTraditionalMatrixMultipleValues [

	| sparseMatrix traditionalMatrix expectedMatrix |
	sparseMatrix := SparseMatrix new.

	"Adding values according to the matrix provided"
	sparseMatrix addValue: 3 atRow: 1 column: 3.
	sparseMatrix addValue: 4 atRow: 1 column: 5.
	sparseMatrix addValue: 5 atRow: 2 column: 3.
	sparseMatrix addValue: 7 atRow: 2 column: 4.
	sparseMatrix addValue: 2 atRow: 4 column: 3.
	sparseMatrix addValue: 6 atRow: 4 column: 4.

	"Converting to traditional matrix"
	traditionalMatrix := sparseMatrix asTraditionalMatrix.

	"Creating the expected result for comparison"
	expectedMatrix := TraditionalMatrix new: 4 columns: 5.
	expectedMatrix addValue: 3 atRow: 1 column: 3.
	expectedMatrix addValue: 4 atRow: 1 column: 5.
	expectedMatrix addValue: 5 atRow: 2 column: 3.
	expectedMatrix addValue: 7 atRow: 2 column: 4.
	expectedMatrix addValue: 2 atRow: 4 column: 3.
	expectedMatrix addValue: 6 atRow: 4 column: 4.

	"Asserting that the traditional matrix matches the expected matrix"
	1 to: 4 do: [ :row |
		1 to: 5 do: [ :col |
			self
				assert: (traditionalMatrix valueAtRow: row column: col)
				equals: (expectedMatrix valueAtRow: row column: col) ] ]
]
