%% academician helper predicates

user:situatedHostHost(<HOST>).
user:situatedHostIP('<IP>').
user:situatedUsername(vagrant).

user:belief(desires(andrewdo,'read-document'(andrewdo,'*Man perl*')),[source(freekbs2('Org::FRDCSA::Academician::Ionzero'))]).


initialize_academician :-
	(   prolog_agent_load_contexts('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1',['Org::FRDCSA::Academician::Ionzero']) -> true ; true).