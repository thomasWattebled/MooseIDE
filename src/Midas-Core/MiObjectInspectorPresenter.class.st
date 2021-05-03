"
I am a subclass of `StObjectInspectorPresenter`.

I rewrite `newInspectionForContext:` method only to return an instance of `MiObjectContextPresenter` instead of `StObjectContextPresenter`. It is the only difference. This is to remove the evaluator of the inspector (the evaluator is the code presenter in the below part of the inspector).
(See `StObjectInspectorPresenter>>#newInspectionForContext:`)
"
Class {
	#name : #MiObjectInspectorPresenter,
	#superclass : #StObjectInspectorPresenter,
	#category : #'Midas-Core-Inspector'
}

{ #category : #'private factory' }
MiObjectInspectorPresenter >> newInspectionForContext: aContext [

	^ MiObjectContextPresenter on: (StObjectContextModel new
			   inspection: self model;
			   inspectedObject: self inspectedObject;
			   context: aContext;
			   yourself)
]