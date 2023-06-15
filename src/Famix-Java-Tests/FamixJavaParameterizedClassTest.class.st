Class {
	#name : #FamixJavaParameterizedClassTest,
	#superclass : #TestCase,
	#instVars : [
		'parametricClass1'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaParameterizedClassTest >> setUp [
	super setUp.
	
	parametricClass1 := FamixJavaParametricClass named:'ParametricClass1'
	
]

{ #category : #running }
FamixJavaParameterizedClassTest >> testConcreteAndGenericParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaParameterType  named:'V'.

parametricClass1  concreteParameter: { parameter1 }.
parametricClass1  genericParameter:  { parameter2  }.
self assertCollection: (parametricClass1  concreteParameter  )
		hasSameElements: {parameter1.  } .
self assertCollection: (parametricClass1  genericParameter  )
		hasSameElements: {parameter2  }.
]

{ #category : #running }
FamixJavaParameterizedClassTest >> testConcreteParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaType named:'Int'.

parametricClass1  concreteParameter: { parameter1. parameter2 }.

self assertCollection: (parametricClass1  concreteParameter  )
		hasSameElements: {parameter1. parameter2  } 
]

{ #category : #running }
FamixJavaParameterizedClassTest >> testConcretisationEntity [

| listT listString |
listT := FamixJavaParametricClass named: 'ListT'.
listString := FamixJavaParametricClass named: 'ListString'.
listT concretisation: (FamixJavaConcretisation new concreteEntity: {listString} ; genericEntity: {listT} ).
self assertCollection: (listT concretisation concreteEntity  )
		hasSameElements: { listString }
]

{ #category : #running }
FamixJavaParameterizedClassTest >> testConcretisationParameter [

| parameterConcrete parameterGeneric |
parameterConcrete := FamixJavaType named:'parametric'.
parameterGeneric := FamixJavaParameterType named:'generic1'.
parameterGeneric concretisation:   (FamixJavaParameterConcretisation  new concreteParam: {parameterConcrete}; genericParam: {parameterGeneric} ).

self assertCollection: (parameterGeneric concretisation concreteParam ) hasSameElements:{parameterConcrete } 
]

{ #category : #running }
FamixJavaParameterizedClassTest >> testGenericParameter [

|  parameter1 parameter2 |
parameter1 := FamixJavaParameterType named:'K'.
parameter2 := FamixJavaParameterType named:'V'.

parametricClass1  genericParameter: { parameter1. parameter2  }.

self assertCollection: (parametricClass1  genericParameter  )
		hasSameElements: {parameter1 . parameter2 } 
]

{ #category : #running }
FamixJavaParameterizedClassTest >> testInheritance [

| class1 class2 |

class1 := FamixJavaClass named:'Class1'.
class2 := FamixJavaClass named:'Class2'.

parametricClass1  addSubInheritance:  (FamixJavaInheritance new
			 subclass: class1 ;
			 superclass: parametricClass1 ). 
			
class1 addSubInheritance: (FamixJavaInheritance new subclass: class2;
superclass: class1).

self assertCollection: (parametricClass1  subclassHierarchy )
		hasSameElements: {class1. class2} 
]

{ #category : #running }
FamixJavaParameterizedClassTest >> testIsConcreteEntity [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaParameterType  named:'V'.
self assert: parametricClass1 isConcreteEntity  .
parametricClass1  concreteParameter: { parameter1 }.
self assert: parametricClass1 isConcreteEntity .
parametricClass1  genericParameter:  { parameter2  }.
self deny: parametricClass1 isConcreteEntity .

]

{ #category : #running }
FamixJavaParameterizedClassTest >> testIsGenericEnity [

|  parameter1 parameter2 |
parameter1 := FamixJavaType named:'String'.
parameter2 := FamixJavaParameterType  named:'V'.
self deny: parametricClass1 isGenericEntity .
parametricClass1  concreteParameter: { parameter1 }.
self deny: parametricClass1 isGenericEntity .
parametricClass1  genericParameter:  { parameter2  }.
self assert: parametricClass1 isGenericEntity .

]
