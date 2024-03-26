Class {
	#name : #TraditionalMatrixTest,
	#superclass : #TestCase,
	#category : #'SparseMatrixEncoder-Tests'
}

{ #category : #'as yet unclassified' }
TraditionalMatrixTest >> createMatrixInstance [
    ^TraditionalMatrix new initialize: 10 columns: 10.
]

{ #category : #'as yet unclassified' }
TraditionalMatrixTest >> matrixClassToTest [
    "Cette méthode doit être redéfinie dans les sous-classes tests pour donner une classe spécifique à tester"
    ^self.
]

{ #category : #tests }
TraditionalMatrixTest >> testAddMultipleValues [
    | traditionalMatrix |
    traditionalMatrix := TraditionalMatrix new: 4 columns: 5.

    "Adding values according to the matrix provided"
    traditionalMatrix addValue: 3 atRow: 1 column: 3.
    traditionalMatrix addValue: 4 atRow: 1 column: 5.
    traditionalMatrix addValue: 5 atRow: 2 column: 3.
    traditionalMatrix addValue: 7 atRow: 2 column: 4.
    traditionalMatrix addValue: 2 atRow: 4 column: 2.
    traditionalMatrix addValue: 6 atRow: 4 column: 3.

    "Asserting that the values are correctly added"
    self assert: (traditionalMatrix valueAtRow: 1 column: 3) equals: 3.
    self assert: (traditionalMatrix valueAtRow: 1 column: 5) equals: 4.
    self assert: (traditionalMatrix valueAtRow: 2 column: 3) equals: 5.
    self assert: (traditionalMatrix valueAtRow: 2 column: 4) equals: 7.
    self assert: (traditionalMatrix valueAtRow: 4 column: 2) equals: 2.
    self assert: (traditionalMatrix valueAtRow: 4 column: 3) equals: 6.

    "Asserting that the rest of the matrix is still zero"
    self assert: (traditionalMatrix valueAtRow: 1 column: 1) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 1 column: 2) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 1 column: 4) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 2 column: 1) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 2 column: 2) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 2 column: 5) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 3 column: 1) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 3 column: 2) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 3 column: 3) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 3 column: 4) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 3 column: 5) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 4 column: 1) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 4 column: 4) equals: 0.
    self assert: (traditionalMatrix valueAtRow: 4 column: 5) equals: 0.
]

{ #category : #tests }
TraditionalMatrixTest >> testAddValue [
    | traditionalMatrix |
    traditionalMatrix := TraditionalMatrix new: 5 columns: 5.
    traditionalMatrix addValue: 1 atRow: 1 column: 1.
    self assert: (traditionalMatrix valueAtRow: 1 column: 1) equals: 1.
]

{ #category : #tests }
TraditionalMatrixTest >> testAsSparseMatrix [
    | traditionalMatrix sparseMatrix |
    traditionalMatrix := TraditionalMatrix new: 5 columns: 5.
    traditionalMatrix addValue: 1 atRow: 1 column: 1.
    sparseMatrix := traditionalMatrix asSparseMatrix.
    self assert: (sparseMatrix valueAtRow: 1 column: 1) equals: 1.
]

{ #category : #tests }
TraditionalMatrixTest >> testAsSparseMatrixAPrint [

	| traditionalMatrix sparseMatrix keysSorted |
	traditionalMatrix := TraditionalMatrix new: 4 columns: 5.

	"Populating the matrix with the given values"
	traditionalMatrix addValue: 3 atRow: 1 column: 3.
	traditionalMatrix addValue: 4 atRow: 1 column: 5.
	traditionalMatrix addValue: 5 atRow: 2 column: 3.
	traditionalMatrix addValue: 7 atRow: 2 column: 4.
	traditionalMatrix addValue: 2 atRow: 4 column: 2.
	traditionalMatrix addValue: 6 atRow: 4 column: 3.

	"Convert to sparse matrix"
	sparseMatrix := traditionalMatrix asSparseMatrix.

	"Sort the keys by row, then by column"
	keysSorted := sparseMatrix elements keys asSortedCollection: [ :a :b |
		              a key = b key
			              ifTrue: [ a value < b value ]
			              ifFalse: [ a key < b key ] ].

	"Printing the sparse matrix to Transcript"
	keysSorted do: [ :key |
		Transcript
			show: (key key - 1) asString;
			show: ' ';
			show: (key value - 1) asString;
			show: ' ';
			show: (sparseMatrix elements at: key) asString ]
]

{ #category : #tests }
TraditionalMatrixTest >> testAsSparseMatrixWithMultipleValues [
    | traditionalMatrix sparseMatrix |
    
    "Create a 4x5 traditional matrix and add the given values"
    traditionalMatrix := TraditionalMatrix new: 4 columns: 5.
    
    "Adding values according to the matrix provided"
    traditionalMatrix addValue: 3 atRow: 1 column: 3.
    traditionalMatrix addValue: 4 atRow: 1 column: 5.
    traditionalMatrix addValue: 5 atRow: 2 column: 3.
    traditionalMatrix addValue: 7 atRow: 2 column: 4.
    traditionalMatrix addValue: 2 atRow: 4 column: 2.
    traditionalMatrix addValue: 6 atRow: 4 column: 3.
    
    "Converting to sparse matrix"
    sparseMatrix := traditionalMatrix asSparseMatrix.
    
    "Asserting that the values are correctly set in the sparse matrix"
    self assert: (sparseMatrix valueAtRow: 1 column: 3) equals: 3.
    self assert: (sparseMatrix valueAtRow: 1 column: 5) equals: 4.
    self assert: (sparseMatrix valueAtRow: 2 column: 3) equals: 5.
    self assert: (sparseMatrix valueAtRow: 2 column: 4) equals: 7.
    self assert: (sparseMatrix valueAtRow: 4 column: 2) equals: 2.
    self assert: (sparseMatrix valueAtRow: 4 column: 3) equals: 6.
    
    "Asserting that the values not set are indeed zero"
    self assert: (sparseMatrix valueAtRow: 1 column: 1) equals: 0.
    self assert: (sparseMatrix valueAtRow: 1 column: 2) equals: 0.
    self assert: (sparseMatrix valueAtRow: 2 column: 1) equals: 0.
    self assert: (sparseMatrix valueAtRow: 2 column: 2) equals: 0.
]

{ #category : #tests }
TraditionalMatrixTest >> testInitialize [
    | traditionalMatrix |
    traditionalMatrix := TraditionalMatrix new: 5 columns: 5.
    self assert: (traditionalMatrix numberOfRows) equals: 5.
    self assert: (traditionalMatrix numberOfColumns) equals: 5.
]

{ #category : #tests }
TraditionalMatrixTest >> testPrintTraditionalMatrix [

	| traditionalMatrix |
	traditionalMatrix := TraditionalMatrix new: 4 columns: 5.

	"Populating the matrix with the given values"
	traditionalMatrix addValue: 3 atRow: 1 column: 3.
	traditionalMatrix addValue: 4 atRow: 1 column: 5.
	traditionalMatrix addValue: 5 atRow: 2 column: 3.
	traditionalMatrix addValue: 7 atRow: 2 column: 4.
	traditionalMatrix addValue: 2 atRow: 4 column: 2.
	traditionalMatrix addValue: 6 atRow: 4 column: 3.

	"Print the matrix to Transcript"
	1 to: traditionalMatrix numberOfRows do: [ :row |
		1 to: traditionalMatrix numberOfColumns do: [ :col |
			Transcript
				show: (traditionalMatrix valueAtRow: row column: col) asString;
				show: ' ' ] ]
]
