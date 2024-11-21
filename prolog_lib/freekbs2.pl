:- dynamic mt_assertion/2.

belief(Assertion,source(microtheory(Mt))) :-
	mt_assertion(Mt,Assertion).
