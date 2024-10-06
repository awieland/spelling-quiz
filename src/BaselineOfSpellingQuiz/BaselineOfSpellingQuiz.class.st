Class {
	#name : #BaselineOfSpellingQuiz,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpellingQuiz
}

{ #category : #loading }
BaselineOfSpellingQuiz class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'spelling-quiz' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfSpellingQuiz >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'SpellingQuiz'
		]
]
