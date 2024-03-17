Class {
	#name : #DocumentationGenerator,
	#superclass : #Object,
	#instVars : [
		'package'
	],
	#category : #DocGenerator
}

{ #category : #initialization }
DocumentationGenerator >> collectClassesInfo [

	^ package classes collect: [ :each |
		  | methodsReferencingIvars formattedIvarReferences methodsString subclassesString |
		  methodsReferencingIvars := each instanceVariables collect: [ :ivar |
			                             | ivarName referencingMethods |
			                             ivarName := ivar name.
			                             referencingMethods := each methods
				                                                   select: [
					                                                   :method |
					                                                   | methodSourceCode referencesVariable |
					                                                   methodSourceCode := method
						                                                                       sourceCode.
					                                                   referencesVariable := methodSourceCode
						                                                                         includesSubstring:
						                                                                         ivarName.
					                                                   referencesVariable ].
			                             ivarName
			                             ->
			                             (referencingMethods collect: [ :method |
				                              method selector ]) ].

		  formattedIvarReferences := String streamContents: [ :stream |
			                             stream tab.
			                             methodsReferencingIvars
				                             do: [ :pair |
					                             stream
						                             nextPutAll: pair key;
						                             nextPutAll: ' references: ('.
					                             pair value isEmpty ifFalse: [
						                             stream nextPutAll:
							                             (String streamContents: [
								                              :innerStream |
								                              pair value
									                              do: [ :selector |
									                              innerStream nextPutAll:
										                              selector ]
									                              separatedBy: [
									                              innerStream nextPutAll: ', ' ] ]) ].
					                             stream nextPutAll: ')' ]
				                             separatedBy: [
					                             stream cr.
					                             stream tab ] ].



		  subclassesString := String streamContents: [ :stream |
			                      each subclasses
				                      do: [ :sub | stream nextPutAll: sub name ]
				                      separatedBy: [ stream nextPutAll: ', ' ] ].

		  methodsString := String streamContents: [ :stream |
			                   (self collectMethodsInfoFor: each)
				                   do: [ :methodInfo |
					                   | senders uniqueSenders |
					                   "Assuming methodInfo is the method name, find its senders"
					                   senders := SystemNavigation default
						                              allSendersOf: methodInfo asSymbol.


					                   "Format the method info with its senders"
					                   stream tab
						                   nextPutAll: methodInfo;
						                   nextPutAll: ' senders: (';
						                   nextPutAll:
							                   (String streamContents: [ :innerStream |
									                    senders
										                    do: [ :methodRef |
											                    innerStream
												                    tab;
												                    nextPutAll: methodRef methodClass name;
												                    nextPutAll: ' >> ';
												                    nextPutAll:
													                    methodRef selector asString ]
										                    separatedBy: [
										                    innerStream nextPutAll: ', ' ] ]);
						                   nextPutAll: ')' ]
				                   separatedBy: [
					                   stream
						                   cr;
						                   tab ] ].

		  ClassInfo new
			  className: each name;
			  superClass:
				  (each superclass ifNotNil: [ :sc | sc name ] ifNil: [ '' ]);
			  subclasses: subclassesString;
			  instanceVariables: formattedIvarReferences;
			  methods: methodsString;
			  yourself ]
]

{ #category : #initialization }
DocumentationGenerator >> collectMethodsInfoFor: aClass [

	^ aClass methods collect: [ :method | method selector ]
]

{ #category : #initialization }
DocumentationGenerator >> generateDocumentation [

	| classesInfo |
	classesInfo := self collectClassesInfo.
	^ self outputDocumentation: classesInfo
]

{ #category : #initialization }
DocumentationGenerator >> initializeWithPackage: aPackage [

	package := aPackage
]

{ #category : #'as yet unclassified' }
DocumentationGenerator >> join: aCollection by: separatorString [

	| stream |
	stream := WriteStream on: String new.
	aCollection
		do: [ :each | stream nextPutAll: each ]
		separatedBy: [ stream nextPutAll: separatorString ].
	^ stream contents
]
