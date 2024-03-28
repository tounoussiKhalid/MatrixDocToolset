Class {
	#name : #Matrix,
	#superclass : #Object,
	#category : #SparseMatrixEncoder
}

{ #category : #adding }
Matrix >> addValue: aValue atRow: rowIndex column: columnIndex [
	"Cette méthode est abstraite et doit être redéfinie par les sous-classes."

	self subclassResponsibility
]

{ #category : #adding }
Matrix >> asSparseMatrix [
	"Convertit la matrice en une SparseMatrix."

	self subclassResponsibility
]

{ #category : #adding }
Matrix >> asTraditionalMatrix [
	"Convertit la matrice en une TraditionalMatrix."

	self subclassResponsibility
]

{ #category : #adding }
Matrix >> valueAtRow: rowIndex column: columnIndex [
	"Cette méthode est abstraite et doit être redéfinie par les sous-classes."

	self subclassResponsibility
]
