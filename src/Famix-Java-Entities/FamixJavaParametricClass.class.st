Class {
	#name : #FamixJavaParametricClass,
	#superclass : #FamixJavaClass,
	#traits : 'FamixTConcreteEntity',
	#classTraits : 'FamixTConcreteEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParametricClass class >> annotation [

	<FMClass: #ParametricClass super: #FamixJavaClass>
	<package: #'Famix-Java-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixJavaParametricClass >> isConcreteEntity [

	self genericParameter ifNotEmpty: [ ^ false ] 
	ifEmpty: [^ true].
]

{ #category : #accessing }
FamixJavaParametricClass >> isGenericEntity [

	self genericParameter ifNotEmpty: [ ^ true ] 
	ifEmpty: [^ false].
]
