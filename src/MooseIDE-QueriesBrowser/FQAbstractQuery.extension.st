Extension { #name : #FQAbstractQuery }

{ #category : #'*MooseIDE-QueriesBrowser' }
FQAbstractQuery class >> isComplementQuery [
	^ false
]

{ #category : #'*MooseIDE-QueriesBrowser' }
FQAbstractQuery >> isNavigationQuery [

	^ false
]

{ #category : #'*MooseIDE-QueriesBrowser' }
FQAbstractQuery >> isScopeQuery [

	^ false
]