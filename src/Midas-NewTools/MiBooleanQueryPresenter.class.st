Class {
	#name : #MiBooleanQueryPresenter,
	#superclass : #MiPropertyQueryPresenter,
	#category : #'Midas-NewTools-Queries Browser configuration'
}

{ #category : #specs }
MiBooleanQueryPresenter class >> layout [

	| padding |
	padding := 5.
	^ SpBoxLayout newLeftToRight
		  add: #propertyDropList
		  expand: false
		  fill: true
		  padding: padding;
		  yourself
]

{ #category : #'instance creation' }
MiBooleanQueryPresenter >> newComparatorDropList [
	^ self newNullPresenter 
]

{ #category : #initialization }
MiBooleanQueryPresenter >> newValueInputField [
	"Boolean queries do not have a value to comapre to (only a comparator: #not or #yourself)"
	^self newNullPresenter
]