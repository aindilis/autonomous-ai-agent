:- module(spami_knowledge_representation, [
					   load_kb/1,
					   update_kb/2
					  ]).

% Load knowledge base from file
load_kb(Filename) :-
	exists_file(Filename),
	consult(Filename).
load_kb(_).

% Update knowledge base and save to file
update_kb(Filename, Systems) :-
	open(Filename, write, Stream),
	forall(member(System, Systems),
	       (   writeq(Stream, System),
		   write(Stream, '.\n')
	       )),
	close(Stream).
