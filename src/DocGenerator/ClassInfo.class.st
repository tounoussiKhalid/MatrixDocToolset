Class {
	#name : #ClassInfo,
	#superclass : #Object,
	#instVars : [
		'className',
		'superClass',
		'subclasses',
		'instanceVariables',
		'methods'
	],
	#category : #DocGenerator
}

{ #category : #accessing }
ClassInfo >> className [

	^ className
]

{ #category : #accessing }
ClassInfo >> className: anObject [

	className := anObject
]

{ #category : #'as yet unclassified' }
ClassInfo >> className: aName superClass: aSuperClass subclasses: aSubclasses instanceVariables: anInstanceVariables methods: aMethods [

	className := aName.
	superClass := aSuperClass.
	subclasses := aSubclasses.
	instanceVariables := anInstanceVariables.
	methods := aMethods
]

{ #category : #'as yet unclassified' }
ClassInfo >> instanceVariableReferences [

	| references |
	references := Dictionary new.
	className instanceVariables do: [ :ivar |
		| methodsReferencingIvar |
		methodsReferencingIvar := className methods select: [ :method |
			                          (method ast allChildren select: [ :node |
				                           node isVariable and: [
					                           node name = ivar ] ]) notEmpty ].
		references
			at: ivar
			put:
			(methodsReferencingIvar collect: [ :method | method selector ]) ].
	^ references
]

{ #category : #accessing }
ClassInfo >> instanceVariables [

	^ instanceVariables
]

{ #category : #accessing }
ClassInfo >> instanceVariables: anObject [

	instanceVariables := anObject
]

{ #category : #'as yet unclassified' }
ClassInfo >> methodSenders [

	^ methods collect: [ :method |
		  { (method selector
		   -> (SystemNavigation default allSendersOf: method) collect: [
			   :sender | sender selector ]) } ] asDictionary
]

{ #category : #accessing }
ClassInfo >> methods [

	^ methods
]

{ #category : #accessing }
ClassInfo >> methods: anObject [

	methods := anObject
]

{ #category : #accessing }
ClassInfo >> subclasses [

	^ subclasses
]

{ #category : #accessing }
ClassInfo >> subclasses: anObject [

	subclasses := anObject
]

{ #category : #accessing }
ClassInfo >> superClass [

	^ superClass
]

{ #category : #accessing }
ClassInfo >> superClass: anObject [

	superClass := anObject
]
